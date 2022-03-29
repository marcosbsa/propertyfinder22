# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'marcos.bsa@gmail.com'
  layout 'mailer'
end
