Rails.application.routes.draw do
  root to: 'home#show'

  get('/start' => 'contests#start')
  get('/play' => 'contests#play')
  get('/fails' => 'contests#fails')
  get('/answer' => 'contests#answer')

  namespace :admin do
    resources :questions
  end

  resources :users
  resource :session
end
