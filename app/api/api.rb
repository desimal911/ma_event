class API < Grape::API
  format :json
  prefix :api

  helpers ::Helpers::Shared

  mount Endpoints::Event
  mount Endpoints::Category
  mount Endpoints::Proposal
  mount Endpoints::Auth

  add_swagger_documentation mount_path: '/swagger_doc'
end
