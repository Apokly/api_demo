module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_teams

      def index
        render json: @teams
      end

      private

      def set_teams
        @teams = current_user.team
      end
    end
  end
end
