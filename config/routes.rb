# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  # rubocop:enable Metrics/BlockLength
  root 'admin'

  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'home/index'
  get 'demo/index'
  # ^ is equivalent to v
  # match 'demo/index', :to => 'demo#index', :via => :get
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  # default route
  # may go away in future versions of rails
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
