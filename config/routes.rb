#== Route Map
# Generated on 11 Aug 2012 09:33
#
#                 users GET    /users(.:format)                 users#index
#                       POST   /users(.:format)                 users#create
#              new_user GET    /users/new(.:format)             users#new
#             edit_user GET    /users/:id/edit(.:format)        users#edit
#                  user PUT    /users/:id(.:format)             users#update
#                       DELETE /users/:id(.:format)             users#destroy
# auth_twitter_callback GET    /auth/twitter/callback(.:format) sessions#create
#                  user GET    /:twitter_name(.:format)         users#show
#               signout GET    /signout(.:format)               sessions#destroy


Thetweetbox::Application.routes.draw do
  root to: "users#new"
  resources :users, except: [:show]
  get "/auth/twitter/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  get "/:twitter_name" => "users#show", :as => 'user'

end

