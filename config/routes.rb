Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    resources :answers, :except => [:show, :index]
  end
  resources :users
end
