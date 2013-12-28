UserAntique::Application.routes.draw do
  get "orderitems/index"
  get "orderitems/show"
  get "orderitems/new"
  get "orderitems/edit"


  devise_for :users do
    resources :orders
  end

  resources :orders do
    resources :orderitems
  end

  resources :profiles
  resources :items

  get "cart/index"
  get "site/about"
  get "site/contact"
  get "site/home"


  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  get '/home' => 'site#home'

  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/category/:id' => 'items#category'
  get '/cups' => 'category#cups'
  get '/search' => 'items#search'

  get '/cart/remove/:id' => 'cart#remove'
  get '/clearCart' => 'cart#clearCart'

  get '/myprofile' => 'profiles#myprofile'
  get '/myprofile/pastorders' => 'profiles#pastorders', as: :pastorders_profiles
  get '/admin' => 'user#admin_login'
  get '/logout' => 'user#logout'
  get '/checkout' => 'cart#createOrder'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'site#home'

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
