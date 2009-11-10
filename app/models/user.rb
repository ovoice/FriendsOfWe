class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :state
end
