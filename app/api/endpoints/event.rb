class Endpoints::Event < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
    requires :requests, type: Hash do
      requires :description, type: String
    end
  end
  namespace :events do
    get do
      # event = Event.create(declared_params)

      # present event, with: Entities::Event::Base
    end
  end
end
