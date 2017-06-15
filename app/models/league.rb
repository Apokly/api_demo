# frozen_string_literal: true

class League < ApplicationRecord
  MAX_USERS = 10

  has_many :users
  has_many :races

  validates_presence_of :name

  after_create :create_races

  def create_races
    Leagues::DefaultRacesService.new(self).call
  end
end
