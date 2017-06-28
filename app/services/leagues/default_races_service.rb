# frozen_string_literal: true

require 'yaml'

module Leagues
  class DefaultRacesService
    DAYS_BEFORE_RACE = 3

    def initialize(league)
      @league = league

      raise ArgumentError, 'League already contains races' if @league.races.any?
    end

    def call
      races = YAML.load_file('config/default_races.yml')
      first_race_date = DAYS_BEFORE_RACE.days.from_now

      races = races.each_with_index do |r, i|
        r[:date] ||= first_race_date + i.days
      end

      @league.races.create!(races)
    end
  end
end
