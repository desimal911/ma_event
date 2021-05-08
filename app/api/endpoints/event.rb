class Endpoints::Event < Grape::API
  namespace :events do
    route_param :event_id, type: Integer do
      get do
        event = Event.find(params[:event_id])
        present event, with: Entities::Event::Base
      end
    end

    get do
      events = Event.all
      present :records, events, with: Entities::Event::Base
    end

    before &:authenticate
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
      optional :image, type: Hash do
        requires :data, type: String
      end
    end

    post do
      event = Event.new(declared_params)

      if event.save
        present event, with: Entities::Event::Base
      else
        present_validation_error_for event
      end
    end

    desc 'Update status event.'
    params do
      requires :id
      requires :user_id
      requires :status
    end

    put do
      event = Event.find(params[:id])

      if event.update(declared_params)
        present event, with: Entities::Event::Base
      else
        present_validation_error_for event
      end
    end
  end
end
