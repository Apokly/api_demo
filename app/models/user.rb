class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password_digest

  has_one :team, foreign_key: :owner_id
end
