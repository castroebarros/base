class ScaffoldController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    self.resources = collection.paginate(page: params[:page])
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    self.resource = model.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    self.resource = model.new(resource_params)

    respond_to do |format|
      if self.resource.save
        format.html { redirect_to self.resource, notice: 'Registro criado com sucesso.' }
        format.json { render :show, status: :created, location: self.resource }
      else
        format.html { render :new }
        format.json { render json: self.resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if self.resource.update(resource_params)
        format.html { redirect_to self.resource, notice: 'Registro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: self.resource }
      else
        format.html { render :edit }
        format.json { render json: self.resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    self.resource.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Registro removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  protected

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      self.resource = model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(resource_param).permit(permit_params)
    end

    def permit_params
      []
    end

    def model
      controller_name.singularize.camelcase.constantize
    end

    def collection
      if params[:q].present?
        model.search(params[:q])
      else
        model.all
      end
    end

    def resources_variable_name
      "@#{controller_name}"
    end

    def resource_variable_name
      "@#{resource_param}"
    end

    def resource_param
      controller_name.singularize.to_sym
    end

    def resource
      instance_variable_get(resource_variable_name)
    end

    def resource=(new_value)
      instance_variable_set(resource_variable_name, new_value)
    end

    def resources
      instance_variable_get(resources_variable_name)
    end

    def resources=(new_value)
      instance_variable_set(resources_variable_name, new_value)
    end
end
