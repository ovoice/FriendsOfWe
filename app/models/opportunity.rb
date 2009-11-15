class Opportunity < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :role
end
