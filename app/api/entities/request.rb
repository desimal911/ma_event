module Entities::Request
  class Base < Grape::Entity
    expose :id
    expose :description
    expose :proposals, with: Entities::Proposal::Base
  end
end
