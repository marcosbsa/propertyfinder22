# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@realtor.com'
  layout 'mailer'
end
