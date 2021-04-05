class Request < ApplicationRecord
  belongs_to :event
  has_many :proposals
end
