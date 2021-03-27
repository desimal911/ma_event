class Endpoints::Request < Grape::API
  params do
    requires :description, type: String
  end
  namespace :descriptions do
    get do
      description = Description.create(declared_params)

      present description, with: Entities::Description::Base
    end
  end
end
