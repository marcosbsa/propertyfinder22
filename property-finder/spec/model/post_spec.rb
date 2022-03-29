# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      post = Post.new(url: 'localhost:3000', body: 'Conteudo', summary: '01').save
      expect(post).to eq(false)
    end

    it 'ensures url presence' do
      post = Post.new(title: 'Title', body: 'Conteudo', summary: '01').save
      expect(post).to eq(false)
    end

    it 'ensures summary presence' do
      post = Post.new(title: 'Title', url: 'localhost:3000', body: 'Conteudo').save
      expect(post).to eq(false)
    end

    it 'ensures body presence' do
      post = Post.new(title: 'Title', url: 'localhost:3000', summary: '01').save
      expect(post).to eq(false)
    end

    it 'should save successfully' do
      post = Post.new(title: 'Title', url: 'localhost:3000', body: 'Conteudo', summary: '01').save
      expect(post).to eq(true)
    end
  end

  context 'scope tests' do
    let(:params) { { title: 'Title', url: 'localhost:3000', body: 'Conteudo', summary: '01' } }
    before(:each) do
      Post.new(params).save
      Post.new(params).save
      Post.new(params.merge(active: true)).save
      Post.new(params.merge(active: false)).save
      Post.new(params.merge(active: false)).save
    end

    it 'should return active posts' do
      expect(Post.active_posts.size).to eq(3)
    end

    it 'should return inactive posts' do
      expect(Post.inactive_posts.size).to eq(2)
    end
  end
end

# RSpec.describe Post, :type => :model do
#     context "Title Validation to Post" do
#         it "It's Valid!" do
#             post = Post.new(title: "First Post", body: "Conteúdo")
#             expect(post).to be_valid
#         end

#         it "It's not Valid!" do
#             post = Post.new(body: "Conteúdo")
#             expect(post).to_not be_valid
#     end

#         it "Return: Can't be blank" do
#             post = Post.new(title: nil)
#             post.valid?
#             expect(post.errors[:title]).to include("Can't be blank")
#     end
#   end

#     context "Title Validation to Post" do
#        it "It's Valid!" do
#            post = Post.new(title: "Second Post", body: "Conteúdo")
#            expect(post).to be_valid
#     end

#        it "It's not Valid!" do
#            post = Post.new(title: "Second Post")
#            expect(post).to_not be_valid
#     end

#     it "Return: Can't be blank" do
#         post = Post.new(body: nil)
#         post.valid?
#         expect(post.errors[:body]).to include("Can't be blank")
#     end
#   end
# end
