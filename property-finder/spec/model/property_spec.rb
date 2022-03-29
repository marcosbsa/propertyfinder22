# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      property = Property.new(address: 'Address', price: '100000', rooms: '4', parking_spaces: '3',
                              square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'ensures address presence' do
      property = Property.new(name: 'Miami', price: '100000', rooms: '4', parking_spaces: '3',
                              square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'ensures price presence' do
      property = Property.new(name: 'Miami', address: 'Address', rooms: '4', parking_spaces: '3',
                              square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'ensures rooms presence' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', parking_spaces: '3',
                              square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'ensures parking_spaces presence' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', rooms: '4',
                              square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'should square_feet successfully' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', rooms: '4',
                              parking_spaces: '3', details: 'Details', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'should details successfully' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', rooms: '4',
                              parking_spaces: '3', square_feet: '3422', bathrooms: '2').save
      expect(property).to eq(false)
    end

    it 'should bathrooms successfully' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', rooms: '4',
                              parking_spaces: '3', square_feet: '3422', details: 'Details').save
      expect(property).to eq(false)
    end

    it 'should save successfully' do
      property = Property.new(name: 'Miami', address: 'Address', price: '100000', rooms: '4',
                              parking_spaces: '3', square_feet: '3422', details: 'Details', bathrooms: '2').save
      expect(property).to eq(true)
    end
  end

  context 'scope tests' do
    let(:params) do
      { name: 'Miami', address: 'Address', price: '100000', rooms: '4', parking_spaces: '3', square_feet: '3422',
        details: 'Details', bathrooms: '2' }
    end
    before(:each) do
      Property.new(params).save
      Property.new(params).save
      Property.new(params.merge(for_sale: true)).save
      Property.new(params.merge(for_sale: false)).save
      Property.new(params.merge(for_sale: false)).save
    end

    it 'should return for_sale properties' do
      expect(Property.for_sale_properties.size).to eq(3)
    end

    it 'should return for_rent properties' do
      expect(Property.for_rent_properties.size).to eq(2)
    end
  end
end
