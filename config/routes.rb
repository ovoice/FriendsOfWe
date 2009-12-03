ActionController::Routing::Routes.draw do |map|
  
  map.register 'register', :controller => :users, :action => :new 
  #if you change the above, change the reference in commitments_controller
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :projects, :as => 'campaigns' do |c|
    c.resources :commitments
    c.resources :opportunities do|o|
      o.resources :commitments
    end
  end
  map.resources :assets
  map.resources :commitments
  #map.resources :opportunities
  map.resources :users, :as => 'volunteers'
  map.resources :user_sessions
  map.resources :password_resets
  
  map.resource :contact, :controller => 'contact'
  map.page '/:id', :controller => 'pages', :action => 'show', :id => /goals|get-involved/
  map.root :controller => 'pages', :action => 'home'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
