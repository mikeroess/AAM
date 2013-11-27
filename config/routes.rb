Ann::Application.routes.draw do
  resource :pages

  root 'pages#index'
  
  #about pages through pages controller
  match 'resume',     to: 'pages#resume',    via: 'get',  as: 'resume'
  match 'biography',  to: 'pages#biography', via: 'get',  as: 'biography'
  match 'criticism',  to: 'pages#criticism', via: 'get',  as: 'criticism'
  match 'about',      to: 'pages#about',     via: 'get',  as: 'about'


  #gallery pages through gallery controller
  match 'newWork',  to:  'galleries#new_work',  via: 'get', as: 'new_work'
  match 'selfPortrait',  to:  'galleries#self_portrait',  via: 'get', as: 'self_portrait'
  match 'plasticCamera',  to:  'galleries#plastic_camera',  via: 'get', as: 'plastic_camera'
  match 'archive',  to:  'galleries#archive',  via: 'get', as: 'archive'
  



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
