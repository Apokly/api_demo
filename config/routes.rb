# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'user_token#create'
      post 'signup' => 'user_token#signup'

      resources :teams
    end
  end
end
