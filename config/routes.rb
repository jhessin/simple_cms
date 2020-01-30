Rails.application.routes.draw do
  get 'home/index'
  root 'demo#index'

  get 'demo/index'
  # ^ is equivalent to v
  # match 'demo/index', :to => 'demo#index', :via => :get

  # default route
  # may go away in future versions of rails
  get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
