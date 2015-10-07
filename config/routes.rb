Rails.application.routes.draw do
  resources :product_code_matches
  resources :product_codes
  resources :fares


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

  resources :direct_flights,  only: [:index, :show] do
   get :explore, on: :collection
   get 'from/:origin', to: 'direct_flights#from',  as: :from, on:  :collection, origin: /[a-zA-Z]{3}/
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

  resources :airlines,   only: [:index, :show],  format: 'json'
  resources :hosts
  resources :carriers,   only: [:index],  format: 'json'
  resources :hubs,       only: [:index],  format: 'json'

  resources :brands


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





  require 'sidekiq/web'
  require 'sidetiq/web'
  mount Sidekiq::Web => '/sidekiq'




end
