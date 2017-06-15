# frozen_string_literal: true

module Api
  module V1
    class TeamsController < ApplicationController
      def index
        record = Team.all

        authorize record, :index?

        render json: record
      end

      def show
        record = params[:id] ? Team.find(params[:id]) : current_user.team

        authorize record, :show?

        render json: record
      end

      def update
        record = params[:id] ? Team.find(params[:id]) : current_user.team

        authorize record, :update?

        if record.update(team_params)
          render json: record, status: :accepted
        else
          render json: record.errors, status: :internal_server_error
        end
      end

      private

      def team_params
        params.permit(:name, :description)
      end
    end
  end
end
