class UserSessionsController < ApplicationController
  
  skip_before_filter :require_user, :except => :destroy
  before_filter :require_no_user, :except => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "You have successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end

