Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'demo/index'
  # ^ is equivalent to v
  # match 'demo/index', :to => 'demo#index', :via => :get
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'

  # default route
  # may go away in future versions of rails
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
