# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validation tests' do
    it 'ensures itens are presences' do
      account = build(:account, first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, email: FFaker::Internet.email,
                                telephone: FFaker::PhoneNumber.phone_number, company: FFaker::Lorem.word, details: FFaker::Lorem.word, password: 'password',
                                password_confirmation: 'password')
      expect(account).to be_valid
    end
  end
end
