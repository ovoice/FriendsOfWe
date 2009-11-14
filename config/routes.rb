ActionController::Routing::Routes.draw do |map|
  
  map.register 'get-involved', :controller => :users, :action => :new
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :commitments
  map.resources :assets
  map.resources :projects, :as => 'campaigns'
  map.resources :user_sessions
  map.resources :users
  map.resource :contact, :controller => 'contact'

  
  map.page '/:id', :controller => 'pages', :action => 'show', :id => /about|goals/
  map.root :controller => 'pages', :action => 'home'
  
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
