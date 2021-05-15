module Helpers::Consts
  AUTH_HEADER = {
    Authorization: {
      description: 'Bearer token to identify user',
      required: true
    }
  }.freeze
end
