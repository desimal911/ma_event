class API < Grape::API
  format :json
  prefix :api

  helpers ::Helpers::Shared

  mount Endpoints::Event
  mount Endpoints::Category
end
