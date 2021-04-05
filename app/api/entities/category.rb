module Entities::Category
  class Base < Grape::Entity
    expose :id
    expose :name
  end
end
