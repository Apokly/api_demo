# frozen_string_literal: true

class RaceSerializer < ActiveModel::Serializer
  attributes :name, :country, :status, :distance, :date, :laps
end
