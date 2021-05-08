module Entities::User
  class Base < Grape::Entity
    expose :first_name
    expose :last_name
    expose :email
    expose :id
  end
end
