Rails.application.routes.draw do
  resources :users do
    resources :events do
      resources :chatmsgs
    end
  end

  resources :playlists
  resources :tracks


  get '/' , to: 'oauth#index'
  post '/users' , to: 'users#create'
  post '/login', to: 'login#index'
  get '/spotify' , to: 'oauth#spotify'
  post '/users/:id/token' , to: 'oauth#create_token'
  get '/users/:id/token', to: 'oauth#get_token'
  get '/events/:id' , to: 'events#show'
  post '/users/:id/profileId', to: 'users#set_profileId'
  post '/events/invite' , to: 'events#find_event_by_invite'
  post '/tracks/:id/vote' , to: 'tracks#vote'
  post '/tracks/:id/unvote', to: 'tracks#unvote'
  get '/events/:id/chatmsgs', to: 'chatmsgs#index'
  post '/tracks/event' , to: 'tracks#event'
end
