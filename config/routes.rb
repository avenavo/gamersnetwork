Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end
  resources :messages


  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  authenticate :user do
    resources :posts, :except => [:show, :new]
    resources :comments
    resources :games, :except => [:new]
    resources :users do
      resources :games 
      get 'users/:id' => 'users#show'
      post 'games/:id/update_properties' => 'games#update_properties', as:  :update_property 
    end
    get 'friends' => 'users#friends_index', as:  :friends 
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end


  resources :friendships do
    member do
      post 'friend_request'
      post 'friend_request_accept'
      delete 'friend_request_reject'
    end
  end

  #post '/users/:user_id/games/:id/update_properties' => 'games#update_properties' 

  
 

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
