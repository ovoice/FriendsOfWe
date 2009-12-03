class Notifications < ActionMailer::Base
  default_url_options[:host] = "FriendsOfWe.org"  
  
  def new_commitment_notification(user)
    setup_message
    subject    'FOW: User has volunteered'
    recipients  ADMIN_RECIPIENT
    body        :volunteer => user
  end
  
  def contact_form(contact)
    setup_message
    subject    'FOW: Contact Form Submitted'
    recipients  ADMIN_RECIPIENT
    body        :contact =>  contact
  end
  
  
  def password_reset_instructions(user)
    setup_message
    subject    'Password Reset Instructions'
    recipients user.email
    body       :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end
  
  def registration_confirmation(user)
    setup_message
    subject     'Thanks for signing up at FriendsOfWe.org!'
    recipients user.email
    bcc         ADMIN_RECIPIENT
    body        :user_name => user.name
  end
  
  private
  
  def setup_message
    from "Friends of We"
    reply_to ADMIN_RECIPIENT
    sent_on Time.now
  end

end
