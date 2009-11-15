ActionController::Routing::Routes.draw do |map|
  
  map.register 'get-involved', :controller => :users, :action => :new
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :projects, :as => 'campaigns'
  map.resources :assets
  map.resources :commitments
  map.resources :opportunities
  map.resources :users, :as => 'volunteers' do |users|
    users.resources :commitments
  end
  map.resources :user_sessions
  map.resources :password_resets
  
  map.resource :contact, :controller => 'contact'
  map.page '/:id', :controller => 'pages', :action => 'show', :id => /about|goals/
  map.root :controller => 'pages', :action => 'home'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
