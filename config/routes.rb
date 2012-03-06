TodoList::Application.routes.draw do
 
#  devise_for :users

  get "/signup", :to => 'users#new', :as => 'signup'
  post "/signup", :to => 'users#create'
  
  get "/signin", :to => 'sessions#new', :as => 'signin'
  post "/signin", :to => 'sessions#create', :as => 'session_new'
  get "/signout", :to => 'sessions#destroy', :as => 'signout'

  resources :projects, :only => [:index, :show, :create, :destroy, :update] do
    member do
        get "share"
        post "share/:finded", :to =>"projects#addUser"
        delete "share/:finded", :to =>"projects#delUser"  
    end
    collection do
      get "my"
      get "foreign"
    end
    
    resources :lists, :only => [:show, :create, :destroy, :update] do
      resources :tasks, :only => [:create, :destroy, :update] do
        member do
          get "share"
          post "share/:finded", :to =>"tasks#addUser"
          delete "share/:finded", :to =>"tasks#delUser"
          get "check", :to => "tasks#check"  
        end
        collection do
          delete "completed" => "tasks#delete_completed"
        end
      end
    end
  end 
  
  get "/completed" => "tasks#completed", :as => "completed_tasks"
  get "/incompleted" => "tasks#incompleted", :as => "incompleted_tasks" 
  
  root :to => 'projects#my'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
