class User < ApplicationRecord
  has_many :messages
  has_secure_password
  validates :username, length: { minimum: 2, maximum: 20 }, presence: true
  validates :password_digest, presence: true
end
