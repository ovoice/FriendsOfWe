class User < ActiveRecord::Base
  has_many :commitments
  has_many :projects, :through => :commitments
  
  acts_as_taggable_on :interests, :skills
  acts_as_authentic do |c|
    login_field :email
  end
  
  attr_accessible :name, :email, :password, :state, :title, :password_confirmation
  
  def admin?
    state == 'admin'
  end
  
  def state
    super || 'new'
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifications.deliver_password_reset_instructions(self)  
  end  
  
end
