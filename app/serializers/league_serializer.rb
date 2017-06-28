# frozen_string_literal: true

class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :privacy

  has_many :users
  has_many :races
end
