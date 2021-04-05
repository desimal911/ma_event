module Entities::Event
  class Base < Grape::Entity
    expose :title
    expose :body
    expose :date_time
    expose :location
    expose :category_id
    expose :images

    expose :requests, with: Entities::Request::Base
  end
end
