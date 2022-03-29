# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  it 'is invalid if the price, rooms, bathrooms, parking spaces and square feet are less than 0' do
    property = build(:property, price: FFaker::Random.rand(-99..-1), rooms: FFaker::Random.rand(-99..-1),
                                bathrooms: FFaker::Random.rand(-99..-1), parking_spaces: FFaker::Random.rand(-99..-1),
                                square_feet: FFaker::Random.rand(-99..-1))
    expect(property).to_not be_valid
  end
  it 'is valid if price, rooms, bathrooms, parking spaces and square feet are more the 0' do
    property = build(:property, price: FFaker::Random.rand(1..999_999_999), rooms: FFaker::Random.rand(1..99),
                                bathrooms: FFaker::Random.rand(1..99), parking_spaces: FFaker::Random.rand(1..99),
                                square_feet: FFaker::Random.rand(1..999_999))
    expect(property).to be_valid
  end

  it 'is invalid if price, rooms, bathrooms, parking spaces and square feet are less than 0' do
    name, address, details = FFaker::Lorem.word
    price, rooms, bathrooms, parking_spaces, square_feet = FFaker::Random.rand(-99..-1)
    property = Property.new(name: name, address: address, details: details, price: price, rooms: rooms,
                            bathrooms: bathrooms, parking_spaces: parking_spaces, square_feet: square_feet)
    expect(property).to_not be_valid
  end

  context 'validation tests' do
    it 'ensures itens are presences' do
      property = build(:property, name: FFaker::Lorem.word, address: FFaker::Lorem.word, price: FFaker::Random.rand(1..999_999_999),
                                  rooms: FFaker::Random.rand(1..99), bathrooms: FFaker::Random.rand(1..99),
                                  parking_spaces: FFaker::Random.rand(1..99), square_feet: FFaker::Random.rand(1..999_999),
                                  details: FFaker::Lorem.word)
      Rack::Test::UploadedFile.new('spec/fixtures/files/affiliate.jpeg', 'image/jpeg')
      Rack::Test::UploadedFile.new('spec/fixtures/files/banner_miami.jpg', 'image/jpg')
      expect(property).to be_valid
    end
  end
end
