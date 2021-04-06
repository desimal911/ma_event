class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :request

  enum status: [:pending, :accepted, :declined], _default: 'pending'
  
end
