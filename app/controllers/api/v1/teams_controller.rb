# frozen_string_literal: true

module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_team

      def index
        record = @team
        authorize record

        render json: record
      end

      private

      def set_team
        @team = current_user.team
      end
    end
  end
end
