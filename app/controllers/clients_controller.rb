class ClientsController < ScaffoldController
  before_action { @menu = 'clients' }

  private
    def collection
      scope = Client.by_name
      if params[:q].present?
        scope = scope.search(params[:q])
      end
      scope
    end

    def permit_params
      [:name, { phones_attributes: [:id, :number, :_destroy],
                emails_attributes: [:id, :address, :_destroy] }]
    end
end
