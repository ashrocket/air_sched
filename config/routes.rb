Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'search#index' 

  resource :emails, :controller => 'emails', as: 'mail', only: [:index] do
           get '/', action: :index
           get 'msg_ids',  format: 'json'
           get 'validity',  format: 'json'
           get 'list', format: 'json'

           # These should be POSTs with no data, but get is easier to use
           get 'reload', format: 'json'
           get 'reset', format: 'json'
           get 'process_inbox', format: 'json'

           # These are posts with data
           post 'remove', format: 'json'
           post 'archive', format: 'json'
           post 'handle_mail', format: 'json'
  end

  resources :oag_schedules,  only: [:mkt],  format: 'json' do
   get 'mkt/:origin/:dest', action: :mkt,  on: :collection, as: :markets, format: 'json', origin: /[a-zA-Z]{3}/, dest: /[a-zA-Z]{3}/
   get 'to_hub/:origin',   action: :to_hub,   on: :collection, format: 'json',  origin: /[a-zA-Z]{3}/
   get 'from_hub/:dest', action: :from_hub, on: :collection, format: 'json', dest: /[a-zA-Z]{3}/
  end

  resources :destinations,  only: [:index, :show] do
   get :explore, on: :collection
   get 'hubs/:origin/:dest', action: :hubs, on: :collection, as: :hubs, format: 'json'
  end
  resources :cnx_pairs, only: [:show], format: 'json'
  resources :cnx_pairs, only: [:destinations], path: 'connections', as: 'connections' ,format: 'json' do
    get 'from/:origin', to: 'cnx_pairs#from',  as: :from, on:  :collection, origin: /[a-zA-Z]{3}/
  end

  resources :search, only: [:index] do
   get '(/:origin_code)(/:dest_code)(/:depart)/(:owrt)(/:ret_date)',  action: :index,
       on:  :collection, format: 'html',
       origin: /[a-zA-Z]{3}/, dest: /[a-zA-Z]{3}/, depart: /\d{2}\-\d{2}\-\d{4}/, ret_date: /\d{2}\-\d{2}\-\d{4}/, owrt: /OW|RT/
  end
  #post 'search', to: 'search#search', as: :search, format: 'json'
  post 'search', to: 'search#search', as: :search

  resources :direct_flight, only: [:none] do
  end

  resources :send_emails

  resources :city_pairs, only: [:show] do
   get '(/:orig)(/:dest)(/:leave_date)/(/:return_date)',  action: :show,
       on:  :member, format: 'json'
  end


  resources :airports,  only: [:show],  format: 'json', id: /[a-zA-Z]{3}/ do
    member do
      get 'dest(/:query)',  action: :dest, as: :dest
    end
    collection do
      get 'origins(/:query)', action: :origins, as: :origins
      get 'origins/dest'    , action: :dest
      get 'airports',  action: :airports, as: :airports
    end
  end

  resources :airlines, only: [:index, :show],  format: 'json'
  resources :carriers,   only: [:index],  format: 'json'
  resources :hubs,   only: [:index],  format: 'json'



  namespace :admin do
    resources :abb_configs

    resources :market_data_exports, only: [:index] do
        collection do
            get  :tasks, action: :tasks
            post :generate, to: 'market_data_exports#generate', as: :generate
        end
    end
      # # mount Sidekiq::Web => '/sidekiq'
      # resources :abb_config, as: 'config', only: [:index] do
      #   get 'index'
      # end

  end

  resources :report_keys do
    resources :interline_cxr_rules

  end

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
  require 'sidekiq/web'
  require 'sidetiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
