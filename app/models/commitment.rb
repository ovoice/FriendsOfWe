class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :state, :user_id, :project_id
end
