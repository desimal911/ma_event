class Endpoints::Posts < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
  end
  namespace :posts do
    get do
      post = Post.create(declared_params)

      present post, with: Entities::Post::Base
    end
  end
end
