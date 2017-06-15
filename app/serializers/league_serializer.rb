# frozen_string_literal: true

class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users
end
