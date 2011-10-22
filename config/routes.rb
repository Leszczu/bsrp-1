Bsrp::Application.routes.draw do

  get "comments/_comment"

  # Resources
  resources :players
  resources :sessions
  resources :comments
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Strona G³ówna
  root :to => 'news#index'
  
  # Newsy
  match 'news/:cached_slug' => 'news#show', :as => :show

  # Konta
  match 'konto/rejestracja' => 'players#new', :as => :register
  match 'konto/logowanie' => 'sessions#new', :as => :login
  match 'konto/wyloguj' => 'sessions#destroy', :as => :logout
  match 'konto/:cached_slug' => 'players#show', :as => :playershow
  
  # Kokpit
  match 'kokpit' => 'cockpit#index', :as => :cockpit
  match 'kokpit/biografia' => 'cockpit#biography', :as => :biography
  match 'kokpit/ubranie' => 'cockpit#skins', :as => :skins
  match 'kokpit/pojazdy' => 'cockpit#vehicles', :as => :vehicles
  match 'kokpit/szukaj/gracz' => 'cockpit#find_player', :as => :player_find
  match 'kokpit/edycja/profil' => 'cockpit#profile', :as => :profile
  match 'kokpit/logi' => 'cockpit#logs', :as => :logs
  match 'kokpit/gracze/online' => 'cockpit#online', :as => :online
  match 'kokpit/edycja/avatar' => 'cockpit#avatar', :as => :avatar
  match 'kokpit/galeria' => 'cockpit#gallery', :as => :gallery
  
  # Kokpit > Has³o
  match 'kokpit/edycja/haslo' => 'cockpit#change_password', :as => :change_password
  put 'kokpit/edycja/haslo/aktualizuj' => "players#update", :as => :update_password
  
  # Komentarze
  # resources :news, :has_many => :comments
  
  # scope "/kokpit/haslo" do
  #     put   "aktualizuj" => "players#update", :as => :update_profile
  #     match "edytuj" => "players#edit", :as => :edit_profile
  #     match "/" => "players#index", :as => :account
  # end
  
  # Podstrony
  match 'administracja' => 'home#admins', :as => :admins
  match 'organizacje' => 'home#organizations', :as => :organizations
  match 'ostatnie-zmiany' => 'home#last_changes', :as => :last_changes
  match 'kontakt' => 'home#contact', :as => :contact
  
  
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
