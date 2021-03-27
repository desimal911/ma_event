class Event < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :category

  has_many :requests
  accepts_nested_attributes_for :requests
end
