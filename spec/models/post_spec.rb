# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    it 'ensures title, post, summary and body presences' do
      post = build(:post, title: FFaker::Lorem.word, url: FFaker::Lorem.word,
                          summary: FFaker::Lorem.word, body: FFaker::Lorem.word)
      Rack::Test::UploadedFile.new('spec/fixtures/files/careers.jpg', 'image/jpg')
      expect(post).to be_valid
    end
  end
end
