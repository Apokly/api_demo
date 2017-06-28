# frozen_string_literal: true

class Race < ApplicationRecord
  belongs_to :league

  validates_presence_of :name, :status, :date
  enum status: %i[todo in_progress finished]

  def status
    super || 'todo'
  end

  def total_distance
    distance * laps
  end
end
