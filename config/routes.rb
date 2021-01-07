Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  root to: "home#index"
  resources :jobs do
    collection do
      get 'search'
    end
  end
  resources :users

end
