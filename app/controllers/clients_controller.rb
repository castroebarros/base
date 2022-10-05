class ClientsController < ScaffoldController
  private
    def collection
      Client.order('name ASC')
    end

    def permit_params
      [:name, { phones_attributes: [:id, :number, :_destroy],
                emails_attributes: [:id, :address, :_destroy] }]
    end
end
