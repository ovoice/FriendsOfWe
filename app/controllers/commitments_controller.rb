class CommitmentsController < InheritedResources::Base
  #belongs_to :user
  #actions :all, :except => [:new, :create]
  
  before_filter :only => :new  do |c| 
    c.send(:require_user, '', '/register')
  end
  
  def create
    create!{root_url}
  end

end
