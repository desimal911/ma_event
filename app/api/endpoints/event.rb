class Endpoints::Event < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
    requires :category_id, type: Integer
    optional :user_id, type: Integer
    requires :requests_attributes, type: Array do
      requires :description, type: String
    end
  end
  namespace :events do
    post do
      event = Event.create!(declared_params)
      present event, with: Entities::Event::ForAuthor
    end
  end
end
