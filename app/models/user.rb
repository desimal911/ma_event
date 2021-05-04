class User < ApplicationRecord
  authenticates_with_sorcery!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :proposals
end
