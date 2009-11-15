class Notifications < ActionMailer::Base
  default_url_options[:host] = "FriendsOfWe.org"  
  

  def password_reset_instructions(user)
    subject    'Password Reset Instructions'
    recipients user.email
    from       'Friends Of We'
    sent_on    Time.now
    
    body       :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end

end
