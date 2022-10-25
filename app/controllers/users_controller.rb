class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :confirm, :invite]

  # GET /users
  # GET /users.json
  def index
    authorize User

    @users = User.all
    @users = @users.where("name ilike '%' || ? || '%'", params[:name]) if params[:name].present?
    @users = @users.where("email ilike '%' || ? || '%'", params[:email]) if params[:email].present?
    @users = @users.where(profile: params[:profile]) if params[:profile].present?
    @users = @users.where(active: params[:active]) if params[:active].present?
    @users = @users.where('current_sign_in_at >= ?', params[:date_from]) if params[:date_from].present?
    @users = @users.where('current_sign_in_at <= ?', params[:date_to].to_date.end_of_day) if params[:date_to].present?

    @users = @users.reorder(:name => params[:sort_order]) if params[:sort_field] == 'name'
    @users = @users.reorder(:email => params[:sort_order]) if params[:sort_field] == 'email'
    @users = @users.reorder(:profile => params[:sort_order]) if params[:sort_field] == 'profile'
    @users = @users.reorder(:active => params[:sort_order]) if params[:sort_field] == 'active'
    @users = @users.reorder(:current_sign_in_at => params[:sort_order]) if params[:sort_field] == 'date'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  def invite
    authorize @user
    @user.confirm
    UserMailer.invite(@user).deliver
    redirect_to request.referer, notice: "Email enviado para: #{@user.email}"
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  def confirm
    authorize @user
    @user.confirm
    redirect_to users_path, notice: "E-mail #{@user.email} confirmado."
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # Remove password if it is empty.
    update_params = user_params.dup
    if update_params[:password].empty?
      update_params.delete :password
      update_params.delete :password_confirmation
    end

    respond_to do |format|
      if @user.update(update_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def login_as
    @user = User.find(params[:id])
    authorize @user
    sign_in(@user, bypass: true)
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:name, :email, :profile, :password, :password_confirmation, :status, :client_id, :recipient_id)
    end
end
