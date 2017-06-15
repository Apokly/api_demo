# frozen_string_literal: true

class League < ApplicationRecord
  MAX_USERS = 10

  validates_presence_of :name

  has_many :users
end
