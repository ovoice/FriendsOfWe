class Project < ActiveRecord::Base
  has_many :assets, :as => :assetable
  has_many :volunteers, :class_name => "User", :through => :commitments #, :condition => 'state = "confirmed"'
  
  attr_accessible :name, :description, :activities, :state, :volunteer_count
end
