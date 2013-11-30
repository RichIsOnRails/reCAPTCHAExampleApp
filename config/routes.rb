ReCAPTCHAExample::Application.routes.draw do
  resource :home, only: [:show], controller: :home
  resource :users, only: [:new, :create]
  root to: "home#show"
end
