class Endpoints::Category < Grape::API
  params do
    requires :name, type: String
  end
  namespace :categories do
    get do
      category = Category.create(declared_params)

      present category, with: Entities::Category::Base
    end
  end
end
