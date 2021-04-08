class Endpoints::Proposal < Grape::API
  namespace :proposals do
    helpers do
      params :update_status do
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

    params { use :create_proposal }
    post do
      proposal = Proposal.new
      proposal.update(declared_params)
      proposal.save
      present proposal, with: Entities::Proposal::Base
    end


    get ':proposal_id'  do
      proposal = Proposal.find(params[:proposal_id])
      present proposal, with: Entities::Proposal::Base
    end


    desc 'Update status proposal.'
    params { use :update_status }
    put ':proposal_id' do
      proposal = Proposal.find(params[:proposal_id])
      proposal.update(declared_params)
    end


  end
end
