class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :only => [:edit, :update, :destroy]
  
  protected

  def collection
    @projects ||= end_of_association_chain.published.paginate :page => params[:page], :per_page => 12
  end
  
end
 
