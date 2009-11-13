class User < ActiveRecord::Base
  has_many :commitments
 # has_many :projects, :through => :commitments
  
  attr_accessible :name, :email, :password, :state, :title, :password_confirmation
  
  acts_as_taggable_on :interests, :skills
  acts_as_authentic do |c|
    login_field :email
  end
  
  def admin?
    state == 'admin'
  end
  
  def state
    super || 'new'
  end
  
end
