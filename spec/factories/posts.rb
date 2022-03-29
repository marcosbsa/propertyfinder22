# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.word }
    url { FFaker::Lorem.word }
    summary { FFaker::Lorem.word }
    body { FFaker::Lorem.word }
  end
end
