class Project < ActiveRecord::Base
  has_many :assets, :as => :assetable
  has_many :commitments
  has_many :volunteers, :through => :commitments, :source => :user  #, :condition => 'state = "confirmed"'
  
  attr_accessible :name, :description, :activities, :state, :volunteer_count
end
