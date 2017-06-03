Rails.application.routes.draw do
  get('/start' => 'contests#start')

  namespace :admin do
    resources :questions
  end

  resources :users
  resource :session 
end
