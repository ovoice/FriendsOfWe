module Railmail
  module ActionMailer
  
    module InstanceMethods
      @@railmail_settings = {}
      mattr_accessor :railmail_settings
    
      def perform_delivery_railmail(mail)
        r = RailmailDelivery.new
        
        r.recipients = mail.to
        r.from = mail.from
        r.subject = mail.subject
        r.sent_at = Time.now
        r.raw = mail
        
        r.save!
      end
    end
  end
end

