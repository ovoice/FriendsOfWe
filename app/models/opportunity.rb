class Opportunity < ActiveRecord::Base
  belongs_to :project
  has_many :commitments
  has_many :volunteers, :through => :commitments, :source => :user 
  attr_accessible :name, :project_id
end
