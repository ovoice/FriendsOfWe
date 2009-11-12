class Project < ActiveRecord::Base
  has_many :assets, :as => :assetable
  has_many :commitments
  has_many :volunteers, :through => :commitments, :source => :user  #, :condition => 'state = "confirmed"'
  
  default_scope :order => 'created_at desc'
  named_scope :features, :conditions => {:featured => true}
  
  attr_accessible :name, :description, :activities, :state, :volunteer_count, :featured
end
