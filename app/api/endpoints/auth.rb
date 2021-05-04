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
      token = JWT.encode payload, nil, 'none'
      { token: token }
    end

    desc 'Chek user'
    params do
      requires :token
    end
    get do
      user = User.find(decode_user['user_id'])
      user
    end
  end
end
