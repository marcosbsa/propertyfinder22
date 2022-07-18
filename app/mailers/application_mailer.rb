# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'marcos@realtor.com'
  layout 'mailer'
end
