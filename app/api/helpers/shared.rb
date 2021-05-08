module Helpers::Shared
  def declared_params
    declared(params, include_missing: false).with_indifferent_access
  end

  def authenticate
    @current_user = User.find(decode[:user_id])

  end

  def decode
    JWT.decode params[:token], nil, 'HS256'
  end

  # def decode
  #   JWT.decode(
  #     headers['Authorization'],
  #     Rails.application.secrets.secret_key_base,
  #     true,
  #     algorithm: 'HS256'
  #   )&.first&.with_indifferent_access
  # end
end
