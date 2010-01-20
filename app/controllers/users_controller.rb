class UsersController < InheritedResources::Base
  before_filter :require_admin, :only => [:index, :destroy]
  before_filter :require_user, :only => [:edit, :update]
  before_filter :require_admin_or_current_user, :only => [:edit, :update]
  before_filter :require_no_user, :only => :new
  
  
 def create
   @user = User.new(params[:user])
   @user.skill_list = params[:user][:skill_list]
   @user.interest_list = params[:user][:interest_list]
   create! do |success, failure|
     success.html { 
      redirect_to_stored_or_default(page_path('get-involved')) 
      Notifications.deliver_registration_confirmation(@user)
    } 
    failure.html {
      render :action =>:new
    }
   end
   
 end
 
end
