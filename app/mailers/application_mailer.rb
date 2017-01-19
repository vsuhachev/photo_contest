class ApplicationMailer < ActionMailer::Base
  include MailerDefaultUrlOptions

  default from: ENV.fetch('RAILS_SMTP_USER', 'from@example.com')

  layout 'mailer'
end
