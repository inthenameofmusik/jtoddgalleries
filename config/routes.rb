Rails.application.routes.draw do
  # get 'about/index'

  # get 'home/index'

  root "home#index"

  resources :home

  get 'about' => 'about#index'
  resources :artworks

  #for users
  get 'fineart' => 'artworks#index2'
  get 'fineart/admin' => 'artworks#index3'
  get 'fineart/q' => 'artworks#q'
  get 'fineart/q' => 'artworks#q2'
  post 'fineart/show' => 'artworks#ajax_show'

  post 'artists/popup' => 'artists#popup'

  #and back
  get 'exhibitions' => 'exhibitions#index'
  get 'exhibitions/admin' => 'exhibitions#admin'
  get 'exhibitions/current' => 'exhibitions#get_current'
  get 'services' => 'services#index'
  resources :articles
  get 'contact' => 'contact#index'

  resources :subjects
  resources :locations
  resources :keywords
  resources :artists
  resources :exhibitions
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
