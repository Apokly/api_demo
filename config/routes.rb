# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'user_token#create'
      post 'signup' => 'user_token#signup'

      resources :teams, only: %i[index show update]
      resource :team, only: %i[show update], as: :user_team

      resources :leagues, only: %i[index join show] do
        member do
          post :join
        end
      end

      resource :league, only: %i[leave show] do
        collection do
          post :leave
        end

        resources :races, only: :index
      end
    end
  end
end
