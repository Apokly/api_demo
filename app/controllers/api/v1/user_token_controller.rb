# frozen_string_literal: true

module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      # override default before_action
      before_action :authenticate, except: :signup

      def signup
        entity = entity_class.new(signup_params)

        if entity.save
          render json: auth_token, status: :created
        else
          render json: entity.errors, status: :bad_request
        end
      end

      private

      def signup_params
        params.require(:auth).permit :username, :password, :password_confirmation
      end
    end
  end
end
