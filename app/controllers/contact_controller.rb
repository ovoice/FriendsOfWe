class ContactController < ApplicationController

  before_filter :check_message, :only => :create

  def new
  end

  def create
    Notifier.deliver_contact_form params[:name], params[:email], params[:message], params[:referer]
    flash[:success] = 'Feedback sent successfully'
    redirect_to root_url
  end

  protected

  def check_message
    if params[:message].blank?
      flash.now[:failure] = 'Please supply a message'
      render :action => :new and return false
    end
  end

end
