class CommitmentsController < InheritedResources::Base
  #belongs_to :user
  #actions :all, :except => [:new, :create]
  
  before_filter :only => :new  do |c| 
    c.send(:require_user, '', '/register')
  end
  
  def new
    @project = Project.find(params[:project_id]) if params[:project_id]
    @opportunity = Project.find(params[:opportunity_id]) if params[:opportunity_id]
    new!
  end
  
  def create
    create!{root_url}
  end

end
