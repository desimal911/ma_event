class Endpoints::Proposal < Grape::API
  namespace :proposals do
    before &:authenticate
    helpers do
      params :update_status do
        requires :status
      end

      params :create_proposal do
        requires :request_id, type: String
        requires :price_cents, type: Integer
        requires :phone_number, type: String
        requires :description, type: String
      end
    end

    desc 'Create proposal'
    params { use :create_proposal }
    post do
      proposal = current_user.proposals.build(declared_params)
      if proposal.save
        present proposal, with: Entities::Proposal::Base
      else
        present_validation_error_for proposal
      end
    end

    desc 'Get proposal by id'
    route_param :proposal_id, type: Integer do
      get do
        event = Proposal.find(params[:proposal_id])
        present event, with: Entities::Proposal::Base
      end
    end

    route_param :proposal_id do
      desc 'Update status proposal.'
      params { use :update_status }
      put do
        proposal = Proposal.find(params[:proposal_id])
        if proposal.update(declared_params)
          present proposal, with: Entities::Proposal::Base
        else
          present_validation_error_for proposal
        end
      end
    end
  end
end
