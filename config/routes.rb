ActionController::Routing::Routes.draw do |map|
  
  map.login 'get-involved', :controller => :users, :action => :new
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :commitments
  map.resources :assets
  map.resources :projects
  map.resources :user_sessions
  map.resources :users
  
  map.page '/:id', :controller => 'pages', :action => 'show', :id => /home|about|goals|/
  map.root :controller => 'pages', :action => 'show', :id => 'home'
  
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
