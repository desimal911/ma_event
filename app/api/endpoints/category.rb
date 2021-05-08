class Endpoints::Category < Grape::API
  before &:authenticate

  namespace :categories do
    get do
      categories = Category.all
      present categories, with: Entities::Category::Base
    end

    params do
      requires :name, type: String
    end
    post do
      category = Category.create(declared_params)

      present category, with: Entities::Category::Base
    end
  end
end
