TodoList::Application.routes.draw do

  get "/signup", :to => 'user#new', :as => 'signup'
  post "/signup", :to => 'user#create'

  get "/signin", :to => 'session#new', :as => 'signin'
  post "/signin", :to => 'session#create', :as => 'session_new'
  get "/signout", :to => 'session#destroy', :as => 'signout'

  post "/newProject", :to =>  'project#create'
  delete ":id/delProject", :to =>  'project#delete'
  put ":id/editProject", :to =>  'project#update'
  
  get ":id/openProject", :to => "project#open"
  
  post "/newTaskList", :to => "list#create"
  delete ":id/delTaskList", :to => "list#delete"
  put ":id/editTaskList", :to => "list#update"
  
  get ":id/openTaskList", :to => "list#open"
  
  post "/newTask", :to => "task#create"
  delete ":id/delTask", :to => "task#delete"
  put ":id/editTask", :to => "task#update"
  
  get ":id/completed", :to => "task#completed"
  
  get ":id/share_task", :to => "task#share_task", :as => "share_task"
  post ":id/share_task/add/:finded", :to =>"task#addUser", :as => "addUserToTask"
  post ":id/share_task/del/:finded", :to =>"task#delUser", :as => "delUserFromTask"

  get ":id/share_project", :to => "project#share_project", :as => "share_project"
  post ":id/share_project/add/:finded", :to =>"project#addUser", :as => "addUserToProject"
  post ":id/share_project/del/:finded", :to =>"project#delUser", :as => "delUserFromProject"
  
  get "/completed", :to => "main#completed", :as => "completed"
  get "/not_completed", :to => "main#not_completed", :as => "not_completed"
  get "/foreign", :to => "main#foreign", :as => "foreign"
  
  delete "/deleteCompletedTasks", :to=>"task#delete_completed"
  
  root :to => 'main#index'

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
