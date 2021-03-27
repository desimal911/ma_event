class Event::API < Grape::API
  format :json
  prefix :api

  helpers Event::Helpers::Shared

  mount Event::Endpoints::Posts
end