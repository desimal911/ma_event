class Endpoints::Event < Grape::API
  namespace :events do
    route_param :event_id, type: Integer do
      get do
        event = Event.find(params[:event_id])
        present event, with: Entities::Event::Base
      end
    end

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
      optional :image, type: File
    end

    post do
      event = Event.new(declared_params.without(:image))

      event.image.attach({ io: params.dig(:image, :tempfile), filename: declared_params[:title]}) if params[:image]
      event.save!

      present event, with: Entities::Event::Base
    end
  end
end
