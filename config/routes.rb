Rails.application.routes.draw do
  get('/start' => 'contests#start')
  get('/play' => 'contests#play')
  get('/answer' => 'contests#answer')

  namespace :admin do
    resources :questions
  end

  resources :users
  resource :session
end
