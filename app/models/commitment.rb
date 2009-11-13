class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :opportunity
  attr_accessible :state, :user_id, :opportunity_id
  
  named_scope :confirmed, :conditions => {:state => 'confirmed'}
  
end
