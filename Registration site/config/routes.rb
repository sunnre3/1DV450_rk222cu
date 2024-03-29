TOERH::Application.routes.draw do
  get "front_page/index"
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
  
  # User routes.
  resources :users do
    resources :apps, :path => 'app'
  end

  # Session routes, eg. login and logout.
  get  'login'  => 'login#index',  :as => 'login_page'
  post 'login'  => 'login#login',  :as => 'login'
  get  'logout' => 'logout#index', :as => 'logout'

  # ControlPanel routes.
  get 'controlpanel' => 'control_panel#index', :as => 'control_panel'

  # API key route.
  get 'api_keys/:auth_token' => 'api_keys#show', :as => 'api_key'

  # Apps routes.
  # resources :apps, :path => 'app'

  # Matches root catalog. Eg. "/"
  root 'front_page#index'
end
