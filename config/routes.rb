require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users, :controllers => {:sessions => "api/v1/sessions"}
  # Api definition
  namespace :api, defaults: { format: :json }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :products, :only => [:create, :update, :destroy]
        resources :orders, :only => [:index, :show, :create]
        end
      # resources :sessions, :only => [:destroy]
      # post '/users/sign_in' => 'sessions#create', :as => :login
      resources :products, :only => [:show, :index]
    end
  end
end
