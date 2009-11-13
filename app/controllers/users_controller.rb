class UsersController < InheritedResources::Base
  before_filter :require_admin, :only => [:index, :destroy]
  before_filter :require_admin_or_current_user, :only => [:edit, :update]
  
 def create
   create!{projects_path}
 end
 
end
