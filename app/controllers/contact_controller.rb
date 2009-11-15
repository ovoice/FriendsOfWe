class ContactController < ApplicationController

  before_filter :check_message, :only => :create

  def new
  end

  def create
    Notifications.deliver_contact_form(params[:contact])
    flash[:success] = 'Your contact request has been sent!'
    redirect_to root_url
  end

  protected

  def check_message
    if params[:contact][:message].blank?
      flash.now[:failure] = 'Please supply a message'
      render :action => :new and return false
    end
  end

end
