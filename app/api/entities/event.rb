module Entities::Event
  class Base < Grape::Entity
    expose :title
    expose :body

    expose :requests, with: Entities::Request::Base
  end
end
