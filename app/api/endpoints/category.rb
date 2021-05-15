class Endpoints::Category < Grape::API
  before &:authenticate

  namespace :categories do
    desc 'Get all events' do
      headers ::Helpers::Consts::AUTH_HEADER
    end
    get do
      categories = Category.all
      present categories, with: Entities::Category::Base
    end

    desc 'Create an event' do
      headers ::Helpers::Consts::AUTH_HEADER
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
