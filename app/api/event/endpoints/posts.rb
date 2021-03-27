class Event::Endpoints::Posts < Grape::API
  params do
    requires :title, type: String
    requires :body, type: String
  end
  namespace :posts do
    get do
      Post.create(declared_params)
    end
  end
end
