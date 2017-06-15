# frozen_string_literal: true

module Api
  module V1
    class LeaguesController < ApplicationController
      before_action :set_league, only: :join

      def index
        records = League.all

        authorize records, :index?

        render json: records
      end

      def join
        record = @league

        authorize record, :join?

        if current_user.update(league: record)
          head :accepted
        else
          render json: record.errors, status: :internal_server_error
        end
      end

      def leave
        authorize current_user.league, :leave?

        if current_user.update(league: nil)
          head :accepted
        else
          render json: record.errors, status: :internal_server_error
        end
      end

      def show
        record = params[:id] ? League.find(params[:id]) : current_user.league

        authorize record, :show?

        render json: record
      end

      private

      def set_league
        @league = League.find(params[:id])
      end
    end
  end
end
