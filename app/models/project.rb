class Project < ActiveRecord::Base
  attr_accessible :name, :description, :activities
end
