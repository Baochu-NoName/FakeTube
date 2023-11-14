Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :videos
      resources :video_categories
      #add these 4 lines for administrate gem
      namespace :active_storage do
        resources :blobs, except: :index
        resources :attachments, except: :index
      end

      root to: "users#index"
    end
# Rails 6.1 is adding a new ActiveStorage::VariantRecord model with accompanying *variant_record* routes, so they also need to be added
   [:blob, :attachment, :variant_record].each do |model|
    %W[admin_#{model} admin_#{model}s edit_admin_#{model}].each do |route_name|
      direct(route_name.to_sym) do |blob, options|
        route_for(route_name.sub("admin", "admin_active_storage").to_sym, blob, options)
      end
    end
   end

  devise_for :users do
    delete '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/:id/edit', to: 'devise/registrations#edit'
  end
  
  #resources :categories
  delete 'categories/:id', to: 'categories#destroy', as:'delete_category'
  #Comment
  resources :videos do
    post '/comments/', to: 'comments#video_comment', as: 'comments'
  end
  delete '/comments/:id/:comment_id', to: 'comments#delete_comment', as: 'delete_comment'
  resources :like_dislikes, only:%i[ destroy ]
  post 'create_like', to: 'like_dislikes#create_like'
  post 'create_dislike', to: 'like_dislikes#create_dislike'

  #Video routes
  # get '/show/:id', to:'videos#show'
  get 'new', to:'videos#new'
  patch 'update/:id', to: 'videos#update', as: 'update_video'
  root 'videos#index'

  get 'about', to:'style#about'
  get 'contact', to:'style#contact'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
