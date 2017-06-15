# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'user_token#create'
      post 'signup' => 'user_token#signup'

      resources :teams, only: %i[index show update]
      resource :team, only: %i[show update], as: :user_team
    end
  end
end
