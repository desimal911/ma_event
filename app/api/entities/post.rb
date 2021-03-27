module Entities::Post
  class Base < Grape::Entity
    expose :title
    expose :body
  end
end
