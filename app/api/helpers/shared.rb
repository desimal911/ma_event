module Helpers::Shared
  def declared_params
    declared(params, include_missing: false).with_indifferent_access
  end

  def decode_user
    decode, = JWT.decode params[:token], nil, false
    decode
  end
end
