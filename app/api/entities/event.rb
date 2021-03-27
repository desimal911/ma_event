module Entities::Event
  class Base < Grape::Entity
    expose :title
    expose :body
  end
end
