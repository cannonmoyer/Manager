Rails.application.routes.draw do

  devise_for :users



  root to: 'customers#index'

  resources :manage_users
  get 'manage_users', to: 'manage_users#new', as: 'users'
  get 'manage_users/:id/edit', to: 'manage_users#edit', as: 'user'
  post 'manage_users', to: 'manage_users#create'
  patch 'manage_users/:id/edit', to: 'manage_users#update'
  resources :customers

  match "/jobs/:keyword/search" => "jobs#search", via: :get
  get 'jobs/active_jobs', to: 'jobs#active_jobs', as: 'show_active_jobs'
  get 'jobs/todays_jobs', to: 'jobs#todays_jobs', as: 'show_todays_jobs'
  resources :jobs

  post 'jobs/:id/create', to: 'jobs#create', as: 'create_job'
  

  get 'jobs/:id/jobs', to: 'jobs#jobs', as: 'customer_job'

  get 'jobs/:id/user_jobs', to: 'jobs#user_jobs', as: 'user_job'

 

  resources :call_lists

  resources :billing

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
