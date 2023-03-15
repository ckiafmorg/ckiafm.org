# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#show'

  resource :session, only: %i[new create destroy]
  resource :lecteur, only: :show
  resource :recherche, only: :show
  resource :membres

  get :admin, to: redirect('/admin/dashboard'), as: :admin
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :emissions do
      resources :diffusions
    end
    resources :publicites
    resources :categorie_emissions
  end
end
