Rails.application.routes.draw do

  

   controller :registrations do
       match :register, via: [:get, :post]
       match :create, via: [:get, :post]
     end
 delete 'logout'  => 'sessions#destroy'
  devise_for :users, :path => '',
             :path_names => {
                 :sign_in => "login",
                 :sign_out => "logout",
                 :sign_up => "register"},
             controllers: {
                 registrations: 'registrations',
                 #omniauth_callbacks: 'omniauth_callbacks',
                 sessions: 'sessions',
                 confirmations: 'confirmations'
             }

 scope '(:locale)' do
    # We define here a route inside the locale thats just saves the current locale in the session
    get 'omniauth/:provider' => 'omniauth#localized', as: :localized_omniauth
  end


  resources :messages

  #get    'signup'  => 'users#new'
  #get    'login'   => 'users#login'
  #post   'login'   => 'usres#login'
  #delete 'logout'  => 'users#logout'

  resources  :categories
  resources  :groups
  resources  :users
  resources :reviews

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'

  #get 'products/index'

  get 'show_products/:id' => 'categories#show_products' , :as => "show_products"
 
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
  resources :searches

  resources :messages do
    collection { get :events }
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root to: "product#index"

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
