# frozen_string_literal: true

require 'yaml'

module Leagues
  class DefaultRacesService
    def initialize(league)
      @league = league

      raise ArgumentError, 'League already contains races' if @league.races.any?
    end

    def call
      races = YAML.load_file('config/default_races.yml')

      @league.races.create!(races)
    end
  end
end
