# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#show'

  resource :session, only: %i[new create destroy]
  resource :lecteur, only: :show
  resource :recherche, only: :show
  resource :programmation, only: :show
  resources :emissions, only: %i[index show]
  resources :blog, only: %i[index show]
  resources :tags, only: %i[show]

  get :admin, to: redirect('/admin/dashboard'), as: :admin
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :emissions do
      resources :diffusions
      resources :emission_episodes
    end
    resources :publicites
    resources :categorie_emissions
    resources :tags
    resources :users
    resources :membres do
      get :renouvellement
    end
    resources :memberships
    resources :articles
  end
end
