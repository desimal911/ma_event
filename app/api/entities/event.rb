module Entities::Event
  class Base < Grape::Entity
    include Rails.application.routes.url_helpers
    expose :id
    expose :title
    expose :body
    expose :starts_at
    expose :location
    expose :category_id
    expose :user_id
    expose :image_url do |entity|
      url_for(entity.image) if entity.image.attached?
    end
    expose :status

    expose :requests, with: Entities::Request::Base
  end
end
