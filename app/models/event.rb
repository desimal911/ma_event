class Event < ApplicationRecord
  extend Enumerize
  belongs_to :user
  belongs_to :category

  has_many :requests
  accepts_nested_attributes_for :requests

  has_one_base64_attached :image

  enumerize :status, in: [:open, :closed, :ongoing], default: :open
end
