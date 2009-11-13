# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user_session, :current_user, :logged_in?, :admin_rights?, :redirect_back_or_default

  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def logged_in?
    !!current_user
  end
  
  def admin_rights?
    logged_in? && current_user.admin?
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access that page. Please log in."
      redirect_to new_user_session_path
      return false
    end
  end

  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to access this page"
      redirect_back_or_default "/"
      return false
    end
  end
  
  def require_admin
    unless current_user && current_user.admin?
      flash[:notice] = "You must be a logged administrator to access this page. You have been redirected."
      redirect_to current_user ? root_url : new_user_session_path
    end
  end
  
  def require_admin_or_current_user
    unless (current_user && current_user.id == params[:id].to_i) || current_user.admin?
      flash[:notice] = "You can only edit your own volunteer account.  You have been redirected to edit your own volunteer account"
      redirect_back_or_default edit_user_path(current_user)
    end
  end
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
  def redirect_back_or_default(path)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to path
  end
  
end
