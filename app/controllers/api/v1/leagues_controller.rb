# frozen_string_literal: true

module Api
  module V1
    class LeaguesController < ApplicationController
      before_action :set_league, only: :join

      def join
        return head :forbidden if current_user.league

        if current_user.update(league: @league)
          head :accepted
        else
          render json: record.errors, status: :internal_server_error
        end
      end

      def leave
        return head :not_found unless current_user.league

        if current_user.update(league: nil)
          head :accepted
        else
          render json: record.errors, status: :internal_server_error
        end
      end

      private

      def set_league
        @league = League.find(params[:id])
      end
    end
  end
end
