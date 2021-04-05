module Entities::Request
  class Base < Grape::Entity
    expose :id
    expose :description
  end
end
