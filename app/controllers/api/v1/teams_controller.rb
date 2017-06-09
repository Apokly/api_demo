# frozen_string_literal: true

module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_team

      def index
        render json: @team
      end

      private

      def set_team
        @team = current_user.team
      end
    end
  end
end
