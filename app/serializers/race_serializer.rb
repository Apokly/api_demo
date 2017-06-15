# frozen_string_literal: true

class RaceSerializer < ActiveModel::Serializer
  attributes :name, :country, :status, :distance
end
