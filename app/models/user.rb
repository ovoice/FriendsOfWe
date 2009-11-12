class User < ActiveRecord::Base
  belongs_to :commitments
  belongs_to :project, :through => :commitments
  
  attr_accessible :name, :email, :password, :status
  
  acts_as_authentic do |c|
    login_field :email
  end
  
end
