Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :categories
  delete 'categories/:id', to: 'categories#destroy', as:'delete_category'
  resources :videos
  root 'videos#index'
  get 'show', to:'videos#show'
  get 'new', to:'videos#new'
  patch 'update/:id', to: 'videos#update', as: 'update_video'
  get 'about', to:'style#about'
  get 'contact', to:'style#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
