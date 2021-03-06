# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require 'carrierwave/orm/activerecord'

# ActionMailer::Base.smtp_settings = {
#     user_name: 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#     password: Rails.application.credentials.dig(:sendgrid, :api_key), # This is the secret sendgrid API key which was issued during API key creation
#     domain: 'property-finder22.herokuapp.com',
#     address: 'smtp.sendgrid.net',
#     port: 587,
#     authentication: :plain,
#     enable_starttls_auto: true
#   }

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 465,
  domain: 'gmail.com',
  user_name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASSWORD'],
  authentication: 'plain',
  ssl: true,
  tsl: true,
  enable_starttls_auto: true
  }
