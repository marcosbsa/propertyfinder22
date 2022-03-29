# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    first_name { FFaker::Lorem.word }
    last_name { FFaker::Lorem.word }
    email { FFaker::Internet.email }
    telephone { FFaker::PhoneNumber.phone_number }
    company { FFaker::Lorem.word }
    details { FFaker::Lorem.word }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
