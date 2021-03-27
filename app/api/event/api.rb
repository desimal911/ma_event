class Event::API < Grape::API
  format :json
  prefix :api
  mount Event::Posts
end