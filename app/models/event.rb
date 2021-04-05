class Event < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :category

  has_many :requests
  has_many_attached :images
  accepts_nested_attributes_for :requests
end
