module MailerHelpers
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def extract_confirmation_token(email)
    email && email.body && email.body.match(/confirmation_token=(.+)">/x)[1]
  end
end

RSpec.configure do |c|
  c.include MailerHelpers, type: :feature
end