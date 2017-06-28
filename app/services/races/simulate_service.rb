# frozen_string_literal: true

module Races
  class SimulateService
    # Races::SimulateService.new(League.last.next_race).call

    def initialize(race)
      @race = race

      raise ArgumentError, 'race is finished' unless @race.todo?
    end

    def call
      @race.update! status: :finished
    end
  end
end
