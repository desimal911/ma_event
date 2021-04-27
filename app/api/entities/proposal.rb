module Entities::Proposal
  class Base < Grape::Entity
    expose :id
    expose :request_id
    expose :user_id
    expose :description
    expose :status
    expose :price_cents
    expose :phone_number
  end
end
