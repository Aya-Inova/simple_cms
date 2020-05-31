Rails.application.routes.draw do
  root 'demo#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do 
    member do 
      get :delete
    end
    resources :pages do
      member do 
        get :delete
      end
      resources :sections do
      member do 
        get :delete
      end
    end
  end
  end
  resources :admin_users

  # simple route/match route
  # get 'play/index'
  get 'demo/index'
  get 'demo/hello'

#default route >> may go away 
  #  get ':controller(/:action(/:id))'
  #  post ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
