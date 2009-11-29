class CommitmentsController < InheritedResources::Base
  belongs_to :user
  actions :all, :except => [:new, :create]
  
  before_filter :load_user, :only => :create
  before_filter :only => [:new, :create]  do |c| 
    c.send(:require_user, '', '/get-involved')
  end
  
  def new
    @commitment = Commitment.new
    @projects = params[:project_id].present? ? Project.all(:conditions => {:id => params[:project_id]}) : Project.recruiting
    #@selected = @projects.first if params[:project_id]  THIS will be supported in the next patch of formtastic
  end
  
  def create
    @projects = Project.find(params[:project].compact.reject(&:empty?))
    @projects.each{|p| Commitment.create(:project_id => p.id, :user_id => @user.id )}
    flash[:success] = "Thanks for volunteering for #{@projects.collect(&:name).to_sentence}.  The project leader has been notified and will get back to you."
    redirect_to root_url
  end
  
end
