class Post < ApplicationRecord
  belongs_to :user
  has_many :media, as: :imageable
end
