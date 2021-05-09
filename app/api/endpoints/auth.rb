class Endpoints::Auth  < Grape::API
  namespace :auth do
    desc 'Log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      user = User.find_by(email: params[:email])

      unless user && user.valid_password?(params[:password])
        error_response = { error: I18n.t('devise.failure.invalid', authentication_keys: 'email')}
        error!(error_response, 401)
      end

      payload = { user_id: user.id }

      token = JWT.encode payload, ENV.fetch('AUTH_SECRET'), 'HS256'

      present :token, token
      present :user, user, with: Entities::User::Base
    end
  end
end
