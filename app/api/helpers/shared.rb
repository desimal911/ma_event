module Helpers::Shared
  attr_reader :current_user
  
  def declared_params
    declared(params, include_missing: false).with_indifferent_access
  end

  def authenticate
    token, = JWT.decode headers['Authorization'], ENV.fetch('AUTH_SECRET'), true, { algorithm: 'HS256' }  

    @current_user = User.find(token['user_id'])
  end
end
