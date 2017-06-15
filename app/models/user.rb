# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  belongs_to :league, optional: true

  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username

  has_one :team, foreign_key: :owner_id

  def self.from_token_request(request)
    username = request.params.dig('auth', 'username')
    find_by username: username
  end
end
