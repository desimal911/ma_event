class Endpoints::Proposal < Grape::API
  namespace :proposals do
    helpers do
      params :update_status do
        requires :id
        requires :request_id
        requires :user_id
        requires :status
      end

      params :create_proposal do
        requires :request_id, type: String
        requires :user_id, type: String
        requires :price_cents, type: Integer
        requires :phone_number, type: String
        requires :description, type: String
      end
    end

    desc 'Create proposal'
    params { use :create_proposal }
    post do
      proposal = Proposal.new
      proposal.update(declared_params)
      present proposal, with: Entities::Proposal::Base
    end

    route_param :id, type: Integer do
      get do
        proposal = Proposal.find(params[:id])
        present proposal, with: Entities::Proposal::Base
      end
    end

    desc 'Update status proposal.'
    params { use :update_status }
    put  do
      proposal = Proposal.find(params[:id])
      proposal.update(declared_params)
    end
  end
end
