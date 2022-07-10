# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'marcosbsa@gmail.com'
  layout 'mailer'
end
