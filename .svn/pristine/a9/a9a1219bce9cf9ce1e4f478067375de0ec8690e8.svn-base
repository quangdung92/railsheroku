Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  scope :admin do
    resources :users, except: [:destroy]
    resources :kinds, except: [:destroy]
    resources :cybozus, only: [:index, :show, :create, :update, :edit, :new, :get_users_of_cybozu, :test_connect] do
      get 'get_users_of_cybozu', on: :collection, defaults: {format: :json}
      post 'test_connect', on: :collection, defaults: {format: :json}
    end
    resources :admin_settings, except: [:destroy] do
      post 'change_status', on: :collection
    end
  end

  resources :meetings, except: [:destroy] do
    put 'cancel', on: :member
    put 'ended', on: :member
    put 'revert', on: :member
  end

  resources :unresolved_ai_lists, only: [:me, :meeting] do
    post 'me', on: :collection 
    post 'meeting', on: :collection 
  end

  resources :proceedings do
    get 'confirm', on: :member
    get 'export_confirm', on: :member
    get 'export_show', on: :member
    post 'update_observer', on: :collection
  end

  resources :materials, except: [:index, :update, :create, :new, :edit, :show] do
    get 'download', on: :member
  end

  resources :accounts, only: [:index, :edit, :update]
  #resources :firstlogin, only: [:index, :edit, :update]

  namespace :api, defaults: {format: :json} do
    namespace :admin do
      resources :users, only: [:get_list] do
        get 'get_list', on: :collection
      end
    end
    resources :users, only: [:index, :get_list_of_proceeding_relation_user] do
      get 'get_list_of_proceeding_relation_user', on: :collection 
    end
    resources :kinds
    resources :unresolved_ai_lists, only: [:me, :meeting] do
      get 'me', on: :collection 
      get 'meeting', on: :collection 
      get 'me_and_count', on: :collection 
      get 'meeting_and_count', on: :collection 
    end
    resources :meeting_lists, only: [:scheduled, :ended] do
      get 'scheduled', on: :collection 
      get 'ended', on: :collection 
    end
    resources :whats_new_lists, only: [:get_whats_new_data, :get_list_of_whats_new_data] do
      get 'get_whats_new_data', on: :collection 
      get 'get_list_of_whats_new_data', on: :collection 
    end
    resources :meetings, only: [:venue, :kind_relation, :search, :get_list] do
      get 'get_list', on: :collection
      get 'venue', on: :collection
      get 'search', on: :collection
      get 'kind_relation', on: :collection
    end
    resources :agendas, only: [:get_agendas_of_proceeding, :delete_agenda, :create_or_update_agenda] do
      get 'get_agendas_of_proceeding', on: :collection 
      post 'delete_agenda', on: :collection 
      post 'create_or_update_agenda', on: :collection 
      post 'all_update_agenda', on: :collection 
    end
    resources :action_items, only: [:get_action_items_of_proceeding, :get_action_items_of_agenda, :create_action_item, :update_action_item, :update_completion_date_of_action_item, :clear_completion_date_of_action_item, :delete_action_item] do
      get 'get_action_items_of_proceeding', on: :collection 
      get 'get_action_items_of_agenda', on: :collection 
      post 'create_action_item', on: :collection 
      post 'update_action_item', on: :collection 
      post 'update_completion_date_of_action_item', on: :collection 
      post 'clear_completion_date_of_action_item', on: :collection 
      post 'delete_action_item', on: :collection 
    end
    resources :materials, only: [:get_materials_of_proceeding] do
      get 'get_materials_of_proceeding', on: :collection 
    end
    resources :comments, only: [:get_comments_of_proceeding, :create_comment] do
      get 'get_comments_of_proceeding', on: :collection 
      post 'create_comment', on: :collection 
    end
    resources :viewers, only: [:confirm_comment] do
      post 'confirm_comment', on: :collection 
    end
    resources :observers, only: [:update_observer] do
      post 'update_observer', on: :collection
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'login#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'home' => 'home#index'
  get 'login' => 'login#index'  
  post 'login' => 'login#login'
  get 'login/logout' => 'login#logout'  
  get 'firstlogin' => 'firstlogin#index'
  post 'firstlogin/update' => 'firstlogin#update'
  patch 'firstlogin/update' => 'firstlogin#update'
  get 'home' => 'home#index'
  post 'materials/upload' => 'materials#upload'
  post 'materials/delete' => 'materials#delete'
  post 'meeting_lists/scheduled' => 'meeting_lists#scheduled'
  get 'meeting_lists/scheduled' => 'meeting_lists#scheduled'
  post 'meeting_lists/ended' => 'meeting_lists#ended'
  get 'meeting_lists/ended' => 'meeting_lists#ended'
  post 'whats_new_lists' => 'whats_new_lists#index'
  get 'whats_new_lists' => 'whats_new_lists#index'
  get 'test_locale' => 'home#testlocale'

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
