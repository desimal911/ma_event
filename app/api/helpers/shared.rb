module Helpers::Shared
  def declared_params
    declared(params, include_missing: false).with_indifferent_access
  end
end
