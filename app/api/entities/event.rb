module Entities::Event
  class Base < Grape::Entity
    include Rails.application.routes.url_helpers

    expose :title
    expose :body
    expose :starts_at
    expose :location
    expose :category_id
    expose :image do |entity|
      rails_blob_path(entity.image, disposition: "attachment", only_path: true)
    end

    expose :requests, with: Entities::Request::Base
  end
end
