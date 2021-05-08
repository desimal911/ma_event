class Endpoints::Event < Grape::API
  namespace :events do
    route_param :event_id, type: Integer do
      desc 'Get event by id'
      get do
        event = Event.find(params[:event_id])
        present event, with: Entities::Event::Base
      end

      desc 'Update status event'
      params do
        requires :status
      end

      put do
        authenticate
        event = current_user.events.find(params[:event_id])

        if event.update(status: declared_params[:status])
          present event, with: Entities::Event::Base
        else
          present_validation_error_for event
        end
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
      requires :requests_attributes, type: Array do
        requires :description, type: String
      end
      optional :image, type: Hash do
        requires :data, type: String
      end
    end

    post do
      event = current_user.events.build(declared_params)

      if event.save
        present event, with: Entities::Event::Base
      else
        present_validation_error_for event
      end
    end
  end
end
