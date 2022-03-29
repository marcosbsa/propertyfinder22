# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller do
  login_account

  describe 'MyController' do
    it 'should have a current_user' do
      expect(subject.current_account).to_not eq(nil)
    end

    it 'should get index' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    context 'from login user' do
      it 'renders a successful response 200:OK' do
        request.host = 'admin.example.com'
        get :index, params: { use_route: '/accounts/sign_in' }
        expect(response).to have_http_status(:success)
      end

      it 'should have on post' do
        create(:post)
        get :index, params: { use_route: '/accounts/sign_in' }
        expect(assigns(:posts)).to_not be_empty
      end
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'should success and render to edit page' do
      get :show, params: { use_route: '/accounts/sign_in', id: post.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'should success and render to new page' do
      get :new, params: { use_route: '/accounts/sign_in' }
      expect(response).to have_http_status(200)
    end

    it 'should new post' do
      get :new
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates the product with correct attributes' do
        post_attributes = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_attributes }
        expect(Post.last).to have_attributes(post_attributes)
      end
    end

    context 'when it has no valid parameters' do
      it 'does not create product' do
        expect do
          post :create, params: { post: { title: '', url: '', summary: '', body: '' } }
        end.to_not change(Post, :count)
      end
    end
  end

  describe 'PUT #update' do
    let!(:post) { create(:post) }

    it 'should update food info' do
      params = { title: 'Update title post' }
      put :update, params: { id: post.id, post: params }
      post.reload
      expect(post.title).to eq(params[:title])
      expect(response).to redirect_to(action: :show, id: assigns(:post).id)
    end

    it 'should not update post info' do
      params = { title: nil }
      put :update, params: { id: post.id, post: params }
      post.reload
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #edit' do
    let(:post) { create(:post) }

    it 'should success and render to edit page' do
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
      expect(assigns(:post)).to be_a(Post)
    end
  end

  describe 'DELETE /destroy' do
    let!(:post) { create(:post) }

    it 'destroys the requested post' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(action: :index)
    end
  end
end
