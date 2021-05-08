class Endpoints::Auth  < Grape::API
  namespace :auth do
    desc 'Log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      user = User.authenticate(params[:email], params[:password])
      payload = { user_id: user.id }

      token = JWT.encode payload, ENV.fetch('AUTH_SECRET'), 'HS256'
      
      present :token, token 
      present :user, user
    end
  end
end
