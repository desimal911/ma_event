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
      category = Category.new(declared_params)
      if category.save
        present category, with: Entities::Category::Base
      else
        present_validation_error_for category
      end
    end
  end
end
