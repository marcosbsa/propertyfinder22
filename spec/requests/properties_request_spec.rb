# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PropertiesController, type: :controller do
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
        create(:property)
        get :index, params: { use_route: '/accounts/sign_in' }
        expect(assigns(:properties)).to_not be_empty
      end
    end
  end

  describe 'GET #show' do
    let(:property) { create(:property) }

    it 'should success and render to edit page' do
      get :show, params: { use_route: '/accounts/sign_in', id: property.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'should success and render to new page' do
      get :new, params: { use_route: '/accounts/sign_in' }
      expect(response).to have_http_status(200)
    end

    it 'should new property' do
      get :new
      expect(assigns(:property)).to be_a(Property)
      expect(assigns(:property)).to be_a_new(Property)
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates the product with correct attributes' do
        property_attributes = FactoryBot.attributes_for(:property)
        post :create, params: { property: property_attributes }
        expect(Property.last).to have_attributes(property_attributes)
      end
    end

    context 'when it has no valid parameters' do
      it 'does not create product' do
        expect do
          post :create, params: { property: { name: '', address: '', price: '', rooms: '', bathrooms: '',
                                              parking_spaces: '', square_feet: '', details: '' } }
        end.to_not change(Property, :count)
      end
    end
  end

  describe 'PUT #update' do
    let!(:property) { create(:property) }

    it 'should update food info' do
      params = { name: 'Update title name' }
      put :update, params: { id: property.id, property: params }
      property.reload
      expect(property.name).to eq(params[:name])
      expect(response).to redirect_to(action: :show, id: assigns(:property).id)
    end

    it 'should not update post info' do
      params = { name: nil }
      put :update, params: { id: property.id, property: params }
      property.reload
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #edit' do
    let(:property) { create(:property) }

    it 'should success and render to edit page' do
      get :edit, params: { id: property.id }
      expect(response).to render_template(:edit)
      expect(assigns(:property)).to be_a(Property)
    end
  end

  describe 'DELETE /destroy' do
    let!(:property) { create(:property) }

    it 'destroys the requested property' do
      delete :destroy, params: { id: property.id }
      expect(response).to redirect_to(action: :index)
    end
  end
end
