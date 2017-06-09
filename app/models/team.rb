# frozen_string_literal: true

class Team < ApplicationRecord
  validates_presence_of :name

  belongs_to :owner, class_name: User
end
