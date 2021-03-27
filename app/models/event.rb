class Event < ApplicationRecord
  belongs_to :user
  has_many :media, as: :imageable
  belongs_to :category
  # attr_accessible :body, :published_at, :title
end
