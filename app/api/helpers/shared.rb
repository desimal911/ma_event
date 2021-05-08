module Helpers::Shared
  attr_reader :current_user

  def declared_params
    declared(params, include_missing: false).with_indifferent_access
  end

  def authenticate
    _, headers_token = headers['Authorization'].split

    token, = JWT.decode  headers_token, ENV.fetch('AUTH_SECRET'), true, { algorithm: 'HS256' }

    @current_user = User.find(token['user_id'])
  rescue
    error_response = { error: I18n.t('devise.failure.unauthenticated') }
    error!(error_response, 401)
  end

  def present_validation_error_for(record)
    present error: record.errors.messages
  end
end
