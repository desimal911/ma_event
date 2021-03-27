class Endpoints::Posts < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
  end
  namespace :events do
    get do
      post = Event.create(declared_params)

      present post, with: Entities::Post::Base
    end
  end
end
