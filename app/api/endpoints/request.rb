class Endpoints::Request < Grape::API
  params do
    requires :description, type: String
  end
  namespace :requests do
    get do
      request = Request.create(declared_params)

      present request, with: Entities::Request::Base
    end
  end
end
