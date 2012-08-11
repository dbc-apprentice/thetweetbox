Thetweetbox::Application.routes.draw do
  root to: "users#new"
  resources :users, except: [:show]
  get "/auth/twitter/callback" => "sessions#create"
  get "/:twitter_name" => "users#show", :as => 'user'
  get "/signout" => "sessions#destroy", :as => :signout

end
