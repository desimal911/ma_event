class Proposal < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :request

  enumerize :status, in: [:pending, :accepted, :declined], default: :pending
end
