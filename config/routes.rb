# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#show'

  resource :session, only: %i[new create destroy]
  resource :lecteur, only: :show

  get :admin, to: redirect('/admin/dashboard'), as: :admin
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :emissions
  end
end
