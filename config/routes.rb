Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: redirect('/auth/google_oauth2')
  get '/auth/google_oauth2/callback', to: 'authentication#authenticate'
  # get '/auth/failure', to: redirect(‘/’)

  resources :item, only: [:index, :create, :update, :destroy]
  # should work like this =>
  # 1 - User wants to login with Google
  # 2 - He authenticates his account with Google and Google send us some infos
  # Those infos are: name, email, profile picture, his google id, and some tokens to access Google APIs
  # I get those infos Google sent us and create a user if it doesn't exist already
  # Them I create a token if some important info needed to authenticate the requests, like user.id
  # Obviously this token is encrypted, so with every request this token is decoded, the server get the user.id and authorize the request.
end
