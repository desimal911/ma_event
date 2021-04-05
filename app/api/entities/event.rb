module Entities::Event
  class Base < Grape::Entity
    expose :title
    expose :body
    expose :starts_at
    expose :location
    expose :category_id
    expose :image

    expose :requests, with: Entities::Request::Base
  end
end
