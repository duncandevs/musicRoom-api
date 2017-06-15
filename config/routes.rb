Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events
  end

  resources :playlists

  get '/' , to: 'oauth#index'
  post '/users' , to: 'users#create'
  post '/login', to: 'login#index'
  get '/spotify' , to: 'oauth#spotify'
  post '/users/:id/token' , to: 'oauth#create_token'
  get '/users/:id/token', to: 'oauth#get_token'
  get '/events/:id' , to: 'events#show'
  post '/users/:id/profileId', to: 'users#set_profileId'
  get '/events/invite/:id' , to: 'events#find_event_by_invite'
end
