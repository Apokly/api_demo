# frozen_string_literal: true

module Api
  module V1
    class RacesController < ApplicationController
      before_action :set_league, only: :show
      before_action :set_race, only: :show

      def index
        records = current_user.league.races

        authorize records, :index?

        render json: records
      end

      def show
        record = @race

        authorize record, :show?

        render json: record
      end

      private

      def set_race
        @race = @league.races.find(params[:id])
      end

      def set_league
        @league = @league.find(params[:league_id])
      end
    end
  end
end
