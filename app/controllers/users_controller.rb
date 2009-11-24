class UsersController < InheritedResources::Base
  before_filter :require_admin, :only => [:index, :destroy]
  before_filter :require_admin_or_current_user, :only => [:edit, :update]
  before_filter :require_no_user, :only => :new
  
  
 def create
   super
   @user.skill_list = params[:user][:skill_list]
   @user.interest_list = params[:user][:interest_list]
   @user.save
   #not sure why, but following is triggering double redirect error - my guuess is a redirect is being called in super
   #create!{redirect_return_or_default(projects_url)}
 end
 
end
