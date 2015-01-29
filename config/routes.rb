Rails.application.routes.draw do

root to: "sites#index"
get "/oauth/connect", to: "sessions#oauth_connect"
get "/oauth/callback", to: "sessions#oauth_callback"
get "/profile", to: "users#profile"
get "/user_homepage", to: "users#home"
get "/logout", to: "sessions#destroy"
get "/user_search", to: "sites#search"
get "/tags_search", to: "sites#search"
  get 'sessions/new' 

  get 'sites/index'

  get 'sites/about'

  get 'sites/collections'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get '/photos/page/:next_max_id', to: 'photos#photo_page'

end
