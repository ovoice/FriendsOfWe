# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user_session, :current_user, :logged_in?, :admin_rights?

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
      store_location
      flash[:notice] = "You must be logged in to access this page."
      redirect_to new_user_session_path
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_back_or_default "/"
      return false
    end
  end
  
  def require_admin
    unless current_user && current_user.admin?
      store_location
      flash[:notice] = "You must be a logged administrator to access this page."
      redirect_to current_user ? root_url : new_user_session_path
    end
  end
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
end
