# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Pundit

  # protect_from_forgery

  before_action :authenticate_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { errors: ['You are not authorized to perform this action.'] }, status: :unauthorized
  end
end
