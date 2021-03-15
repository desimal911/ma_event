class User < ApplicationRecord

  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true, length: { minimum: 8, maximum: 63 }
  validates :email, presence: true, format: { with: EMAIL_VALID }, uniqueness: true

end
