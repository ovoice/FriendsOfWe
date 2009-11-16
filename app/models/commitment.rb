class Commitment < ActiveRecord::Base
  belongs_to :volunteer, :class_name => 'User', :foreign_key => :user_id
  belongs_to :project
  
  named_scope :confirmed, :conditions => 'state = "confirmed"'
  
  attr_accessible :state, :user_id, :project_id, :name
end
