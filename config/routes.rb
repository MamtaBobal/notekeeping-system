Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "notes#index"
  resources :notes do
    resources :users, only: :index
  end
  post '/add_contributor', to: "user_notes#create"
  delete '/remove_contributor', to: "user_notes#destroy"
end
