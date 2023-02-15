Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :videos
      resources :video_categories
      #add these 4 lines for administrate gem
      namespace :active_storage do
        resources :blobs
        resources :attachments
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
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :categories
  delete 'categories/:id', to: 'categories#destroy', as:'delete_category'
  resources :videos

  get 'show', to:'videos#show'
  get 'new', to:'videos#new'
  patch 'update/:id', to: 'videos#update', as: 'update_video'
  root 'videos#index'

  get 'about', to:'style#about'
  get 'contact', to:'style#contact'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
