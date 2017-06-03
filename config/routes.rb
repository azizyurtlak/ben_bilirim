Rails.application.routes.draw do
  get('/start' => 'contests#start')
  get('/play' => 'contests#play')

  namespace :admin do
    resources :questions
  end

  resources :users
  resource :session
end
