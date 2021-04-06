class Endpoints::Proposal < Grape::API
  namespace :proposals do

    params do
      requires :request_id, type: String
      requires :user_id, type: String
      requires :price_cents, type: Integer
      requires :phone_number, type: String
      requires :description, type: String
    end

    post do
      proposal = Proposal.create(declared_params)
      present proposal, with: Entities::Proposal::Base
    end


    get ':proposal_id'  do
      proposal = Proposal.find(params[:proposal_id])

      present proposal, with: Entities::Proposal::Base
    end
  end
end
