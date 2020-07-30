# OAuth2.0 and token based authentication

## Run:
1 - rails db:create db:migrate

2 - rails s

## How it works:
1 - User logins with google on /login

2 - If user doesn't already exist in database, it creates the user with information provided by google: email, name, profile picture...

3 - User id is used to create a token that is encoded and decoded by JWT gem

4 - Server sends the user the token that's going to be used to authenticate every request (This token should be stored on a local storage on front-end or something)

