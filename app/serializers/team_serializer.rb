# frozen_string_literal: true

class TeamSerializer < ActiveModel::Serializer
  attributes :name, :description, :color
end
