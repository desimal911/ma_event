class Endpoints::Event < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
    requires :category_id, type: Integer
    requires :starts_at, type: DateTime
    optional :location, type: String
    optional :user_id, type: Integer
    requires :requests_attributes, type: Array do
      requires :description, type: String
    end
    # optional :images, type: File
    #optional :images, :type => Rack::Multipart::UploadedFile
  end
  namespace :events do
    post do
      event = Event.create!(declared_params)
      present event, with: Entities::Event::Base
    end
  end
end
