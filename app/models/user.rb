class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :events
  has_many :proposals
end
