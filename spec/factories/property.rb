# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    account # evitar o erro : Account must exist
    name { FFaker::Lorem.word }
    address { FFaker::Lorem.word }
    price { FFaker::Random.rand(1..999_999_999) }
    rooms { FFaker::Random.rand(1..99) }
    bathrooms { FFaker::Random.rand(1..99) }
    parking_spaces { FFaker::Random.rand(1..99) }
    square_feet { FFaker::Random.rand(1..999_999) }
    for_sale { true }
    status { 'Available' }
    details { FFaker::Lorem.word }
  end
end
