class RailmailDelivery < ActiveRecord::Base
  serialize :recipients
  serialize :from
  serialize :raw
  
  def new?
    read_at.nil?
  end
  
  def friendly_from
    (from || []).join(", ")
  end
    
  def friendly_recipients
    (recipients || []).join(", ")
  end
end