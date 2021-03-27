class Event::Posts < Grape::API
  helpers ::Shared
  params do
    requires :title, type: String
    requires :body, type: String
  end
  namespace :posts do
    get do
      declared_params
    end
  end

end