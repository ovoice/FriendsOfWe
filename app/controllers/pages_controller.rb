class PagesController < ApplicationController
  unloadable
  before_filter :ensure_valid, :only => 'show'  

  def show
    render :template => current_page
  end
  
  def home
    #not restful, but I didn't want to create a new controller just for this action
    @projects = Project.features
    Tumblr.blog = 'weblog.friendsofwe.org'
    @posts = Tumblr::Post.all(:num => 3, :filter => 'text')
  end

  protected

  def ensure_valid
    unless template_exists?(current_page)
      render :nothing => true, :status => 404 and return false
    end
  end

  def current_page
    "pages/#{params[:id].to_s.downcase}"
  end
  

  def template_exists?(path)
    logger.info response.template.template_format
    view_paths.find_template(path, response.template.template_format)
    rescue ActionView::MissingTemplate
    false
  end
end
