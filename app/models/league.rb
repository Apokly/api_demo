# frozen_string_literal: true

class League < ApplicationRecord
  validates_presence_of :name

  has_many :users
end
