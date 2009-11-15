require 'railmail/action_mailer'

ActionMailer::Base.class_eval do
  include Railmail::ActionMailer::InstanceMethods
end
