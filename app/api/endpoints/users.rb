class Endpoints::Users  < Grape::API
  namespace :users do

    params do
      requires :first_name, type: String
      requires :last_name, type: String
      requires :email, type: String
      requires :password, type: String
    end
    post do
      user = User.new(declared_params)
      if user.save
        present user, with: Entities::User::Base
      else
        present_validation_error_for(user)
      end
    end
  end
  namespace :me do

  desc 'Find me'
    get  do
      authenticate
      present :user, current_user, with: Entities::User::Base
    end
  end
end
