class Post < ApplicationRecord
  belongs_to :user
  has_many :media, as: :imageable
  # attr_accessible :body, :published_at, :title
end
