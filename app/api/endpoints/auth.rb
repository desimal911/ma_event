class Endpoints::Auth  < Grape::API
  namespace :auth do

    desc 'Log in', { headers: 'Authorization' }
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post do
      user = User.authenticate(params[:email], params[:password])
      payload = { user_id: user.id }
      token = JWT.encode payload, nil, 'HS256'
      present(token: token)
      user = User.find(authenticate['user_id'])
      present user

      # user = User.find(authenticate['user_id'])
      # present(user: user)
    end
  end
end
