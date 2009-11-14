class User < ActiveRecord::Base
  belongs_to :commitments
  has_many :projects, :through => :commitments
  
  attr_accessible :name, :email, :password, :state
  
  acts_as_authentic do |c|
    login_field :email
  end
  
  def admin?
    state == 'admin'
  end
  
end
