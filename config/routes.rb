Rails.application.routes.draw do
  get '/reservations/rooms' ,to: 'reservations#index'
  post '/reservations/new' ,to: 'reservations#new'
  get '/reservations/confirm' ,to: 'reservations#confirm'
  post '/reservations' ,to: 'reservations#create'
  get '/rooms/new' ,to: 'rooms#new'
  post '/rooms' ,to: 'rooms#create'
  get '/rooms/regist' ,to: 'rooms#regist_room'
  get '/rooms/search' ,to: 'rooms#search'
  get '/rooms/:id' ,to: 'rooms#show'
  get '/mypages/account' ,to: 'mypages#account'
  get '/mypages/profile' ,to: 'mypages#profile'
  patch '/mypages/update' ,to: 'mypages#update'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  } 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/travels' ,to: 'travels#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
