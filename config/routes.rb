Ann::Application.routes.draw do
  resource :pages

  root 'pages#index'
  
  #about pages through pages controller
  match 'resume',        to: 'pages#resume',           via: 'get',  as: 'resume'
  match 'biography',     to: 'pages#biography',        via: 'get',  as: 'biography'
  match 'criticism',     to: 'pages#criticism',        via: 'get',  as: 'criticism'
  match 'about',         to: 'pages#about',            via: 'get',  as: 'about'
  match 'jewelry',       to: 'pages#jewelry',          via: 'get',  as: 'jewelry'
  #match 'plasticCamera', to: 'pages#plastic_camera',   via: 'get',  as: 'plastic_camera'


  #gallery pages through galleries controller
  match 'newWork',        to:  'galleries#new_work',        via: 'get', as: 'new_work'
  match 'selfPortrait',   to:  'galleries#self_portrait',   via: 'get', as: 'self_portrait'
  match 'plasticCamera',  to:  'galleries#plastic_camera',  via: 'get', as: 'plastic_camera'
  match 'archive',        to:  'galleries#archive',         via: 'get', as: 'archive'  
  match 'pillowBook',     to:  'galleries#pillow_book',     via:'get',  as: 'pillow_book'
  match 'iconDiana',      to:  'galleries#icon_diana',      via: 'get', as: 'icon_diana'
  match 'gardenDiana',    to:  'galleries#garden_diana',    via: 'get', as: 'garden_diana'
  match 'botanicals',     to:  'galleries#botanicals',      via: 'get', as: 'botanicals'
  match 'watches',        to:  'galleries#watches',         via: 'get', as: 'watches'
  match 'group',          to:  'galleries#group',           via: 'get', as: 'group'

  #statement pages through statements controller
  match 'pillowBookStatement',      to: 'statements#pillow_book_statement',       via: 'get',  as: 'pillow_book_statement'
  match 'gardenDianaStatement',     to: 'statements#garden_diana_statement',      via: 'get',  as: 'garden_diana_statement'
  match 'iconDianaStatement',       to: 'statements#icon_diana_statement',        via: 'get',  as: 'icon_diana_statement'
  match 'groupStatement',           to: 'statements#group_statement',             via: 'get',  as: 'group_statement'

  # work details pages through galleries controller
  match 'pillowBook1',              to: 'galleries#pillow_book_1',                  via: 'get',  as:  'pillow_book_1'
  match 'pillowBook2',              to: 'galleries#pillow_book_2',                  via: 'get',  as:  'pillow_book_2'
  match 'pillowBook3',              to: 'galleries#pillow_book_3',                  via: 'get',  as:  'pillow_book_3'
  match 'pillowBook4',              to: 'galleries#pillow_book_4',                  via: 'get',  as:  'pillow_book_4'
  match 'pillowBook5',              to: 'galleries#pillow_book_5',                  via: 'get',  as:  'pillow_book_5'
  match 'pillowBook6',              to: 'galleries#pillow_book_6',                  via: 'get',  as:  'pillow_book_6'
  match 'pillowBook7',              to: 'galleries#pillow_book_7',                  via: 'get',  as:  'pillow_book_7'
  match 'pillowBook8',              to: 'galleries#pillow_book_8',                  via: 'get',  as:  'pillow_book_8'
  match 'pillowBook9',              to: 'galleries#pillow_book_9',                  via: 'get',  as:  'pillow_book_9'
  match 'pillowBook10',              to: 'galleries#pillow_book_10',                  via: 'get',  as:  'pillow_book_10'
  match 'pillowBook11',              to: 'galleries#pillow_book_11',                  via: 'get',  as:  'pillow_book_11'
  match 'pillowBook12',              to: 'galleries#pillow_book_12',                  via: 'get',  as:  'pillow_book_12'
  match 'pillowBook13',              to: 'galleries#pillow_book_13',                  via: 'get',  as:  'pillow_book_13'
  match 'pillowBook14',              to: 'galleries#pillow_book_14',                  via: 'get',  as:  'pillow_book_14'
  match 'pillowBook15',              to: 'galleries#pillow_book_15',                  via: 'get',  as:  'pillow_book_15'

  match 'iconDiana1',              to: 'galleries#icon_diana_1',                  via: 'get',  as:  'icon_diana_1'
  match 'iconDiana2',              to: 'galleries#icon_diana_2',                  via: 'get',  as:  'icon_diana_2'
  match 'iconDiana3',              to: 'galleries#icon_diana_3',                  via: 'get',  as:  'icon_diana_3'
  match 'iconDiana4',              to: 'galleries#icon_diana_4',                  via: 'get',  as:  'icon_diana_4'
  match 'iconDiana5',              to: 'galleries#icon_diana_5',                  via: 'get',  as:  'icon_diana_5'
  match 'iconDiana6',              to: 'galleries#icon_diana_6',                  via: 'get',  as:  'icon_diana_6'
  match 'iconDiana7',              to: 'galleries#icon_diana_7',                  via: 'get',  as:  'icon_diana_7'
 match 'iconDiana8',              to: 'galleries#icon_diana_8',                  via: 'get',  as:  'icon_diana_8'
    match 'iconDiana9',              to: 'galleries#icon_diana_9',                  via: 'get',  as:  'icon_diana_9'
    match 'iconDiana10',              to: 'galleries#icon_diana_10',                  via: 'get',  as:  'icon_diana_10'
    match 'iconDiana11',              to: 'galleries#icon_diana_11',                  via: 'get',  as:  'icon_diana_11'
    match 'iconDiana12',              to: 'galleries#icon_diana_12',                  via: 'get',  as:  'icon_diana_12'
    match 'iconDiana13',              to: 'galleries#icon_diana_13',                  via: 'get',  as:  'icon_diana_13'
    match 'iconDiana14',              to: 'galleries#icon_diana_14',                  via: 'get',  as:  'icon_diana_14'
    match 'iconDiana15',              to: 'galleries#icon_diana_15',                  via: 'get',  as:  'icon_diana_15'
    match 'iconDiana16',              to: 'galleries#icon_diana_16',                  via: 'get',  as:  'icon_diana_16'
    match 'iconDiana17',              to: 'galleries#icon_diana_17',                  via: 'get',  as:  'icon_diana_17'    
    match 'iconDiana18',              to: 'galleries#icon_diana_18',                  via: 'get',  as:  'icon_diana_18'
  match 'iconDiana19',              to: 'galleries#icon_diana_19',                  via: 'get',  as:  'icon_diana_19'

  match 'gardenDiana1',              to: 'galleries#garden_diana_1',                  via: 'get',  as:  'garden_diana_1'
    match 'gardenDiana2',              to: 'galleries#garden_diana_2',                  via: 'get',  as:  'garden_diana_2'
    match 'gardenDiana3',              to: 'galleries#garden_diana_3',                  via: 'get',  as:  'garden_diana_3'
    match 'gardenDiana4',              to: 'galleries#garden_diana_4',                  via: 'get',  as:  'garden_diana_4'
    match 'gardenDiana5',              to: 'galleries#garden_diana_5',                  via: 'get',  as:  'garden_diana_5'
    match 'gardenDiana6',              to: 'galleries#garden_diana_6',                  via: 'get',  as:  'garden_diana_6'
    match 'gardenDiana7',              to: 'galleries#garden_diana_7',                  via: 'get',  as:  'garden_diana_7'
    match 'gardenDiana8',              to: 'galleries#garden_diana_8',                  via: 'get',  as:  'garden_diana_8'
    match 'gardenDiana9',              to: 'galleries#garden_diana_9',                  via: 'get',  as:  'garden_diana_9'
    match 'gardenDiana10',              to: 'galleries#garden_diana_10',                  via: 'get',  as:  'garden_diana_10'
    match 'gardenDiana11',              to: 'galleries#garden_diana_11',                  via: 'get',  as:  'garden_diana_11'
    match 'gardenDiana12',              to: 'galleries#garden_diana_12',                  via: 'get',  as:  'garden_diana_12'
    match 'gardenDiana13',              to: 'galleries#garden_diana_13',                  via: 'get',  as:  'garden_diana_13'
    match 'gardenDiana14',              to: 'galleries#garden_diana_14',                  via: 'get',  as:  'garden_diana_14'
    match 'gardenDiana15',              to: 'galleries#garden_diana_15',                  via: 'get',  as:  'garden_diana_15'
    match 'gardenDiana16',              to: 'galleries#garden_diana_16',                  via: 'get',  as:  'garden_diana_16'
    match 'gardenDiana17',              to: 'galleries#garden_diana_17',                  via: 'get',  as:  'garden_diana_17'
    match 'gardenDiana18',              to: 'galleries#garden_diana_18',                  via: 'get',  as:  'garden_diana_18'
    match 'gardenDiana19',              to: 'galleries#garden_diana_19',                  via: 'get',  as:  'garden_diana_19'
    match 'gardenDiana20',              to: 'galleries#garden_diana_20',                  via: 'get',  as:  'garden_diana_20'

    match 'Group1',              to: 'galleries#group_1',                  via: 'get',  as:  'group_1'
    match 'Group2',              to: 'galleries#group_2',                  via: 'get',  as:  'group_2'
    match 'Group3',              to: 'galleries#group_3',                  via: 'get',  as:  'group_3'
    match 'Group4',              to: 'galleries#group_4',                  via: 'get',  as:  'group_4'
    match 'Group5',              to: 'galleries#group_5',                  via: 'get',  as:  'group_5'
    match 'Group6',              to: 'galleries#group_6',                  via: 'get',  as:  'group_6'
    match 'Group7',              to: 'galleries#group_7',                  via: 'get',  as:  'group_7'
    match 'Group8',              to: 'galleries#group_8',                  via: 'get',  as:  'group_8'
    match 'Group9',              to: 'galleries#group_9',                  via: 'get',  as:  'group_9'
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
