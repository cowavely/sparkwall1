Sparkwall::Application.routes.draw do

  #root :to => 'passthrough#index'
  #get "passthrough/index"

  root :to => 'main#index'

  get "main/index"
  #get "main/welcome"
  #get "main/about"
  #get "main/popular"

  get 'popular' => 'main#popular'
  get 'about' => 'main#about'
  get 'policy' => 'main#policy'

  resources :comments
  resources :likes#, only: [:create, :destroy]
  resources :grade_levels

  resources :projects do
  #   put :like, on: :member
    collection do
      get :search
    end

    member do
      get :add_to_wishlist
      get :remove_from_wishlist
    end
  end

  # resources :users do
  #   member do
  #     get :liked_projects
  #   end
  # end

  devise_for :users, :controllers => {:registrations => "users/registrations"} do
    #   member do
    #     get :liked_projects
    #     get :show
    #   end
    get 'users/:id' => 'users#show'
  end

  resources :users, :only => [:show, :wishlist, :likes] do
    member do
      get 'wishlist'
      get 'likes'
    end
  end


  get 'tagged' => 'projects#tagged', :as => 'tagged'
  get 'reaction' => 'projects#reaction_tagged', :as => 'reaction_tagged'

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
