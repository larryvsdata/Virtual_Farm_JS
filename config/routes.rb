Rails.application.routes.draw do
  resources :comments
  resources :animals , only: [ :edit  , :create , :new , :show , :index]

  resources :farms do
    resources :animals , only: [:show , :new , :edit  , :create , :index]
  end

  resources :owners , only: [:show , :new , :create ]
  resources :comments , only: [:show , :new , :create , :index ]

  root 'farms#index'

  get '/signin' , to: 'sessions#sign_in' ,  as: "signin"
  post '/signin' , to: 'sessions#log_in'
  delete '/signout' , to: 'sessions#sign_out' , as: "signout"

  post '/farms/buy_farm' , to: 'farms#buy_farm'
  post '/farms/sell_farm' , to: 'farms#sell_farm'

  delete '/farms/:id' , to: 'farms#destroy' , as: "delete_farm"
  delete '/farms/:farm_id/animals/:id' , to: 'animals#destroy' , as: "delete_animal"


  get '/owners/:id/getcoowner' , to: 'owners#get_coowner' ,  as: "gcowner"
  post '/owners/:id/getcoowner' , to: 'owners#set_coowner'

  get '/auth/:provider/callback', to: 'sessions#github_login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
