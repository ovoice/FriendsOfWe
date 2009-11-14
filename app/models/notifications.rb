class Notifications < ActionMailer::Base
  

  def password_reset_instructions(sent_at = Time.now)
    subject    'Notifications#password_reset_instructions'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
