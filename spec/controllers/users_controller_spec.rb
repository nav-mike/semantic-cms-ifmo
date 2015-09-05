require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  routes { Workspace::Application.routes }
  login_user

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'redirect to users url' do
      post :create, user: {email: Faker::Internet.email, password: '1234567890'}
      expect(response).to redirect_to users_url
    end

    it 'render new' do
      post :create, user: {email: Faker::Internet.email, password: '123'}
      expect(response).to render_template :new
    end

    it 'create new record' do
      post :create, user: {email: Faker::Internet.email, password: '1234567890'}
      expect(User.count).to eq 2
    end
  end

  describe 'GET #edit' do
    let!(:user) { FactoryGirl.create :user }

    it 'returns http success' do
      get :edit, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    let!(:user) { FactoryGirl.create :user }

    it 'redirect to users url' do
      put :update, user: {email: Faker::Internet.email}, id: user.id
      expect(response).to redirect_to users_url
    end

    it 'render edit' do
      put :update, user: {email: Faker::Internet.email, password: '123'}, id: user.id
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { FactoryGirl.create :user }

    it 'returns http success' do
      delete :destroy, id: user.id
      expect(response).to redirect_to users_url
    end
  end
end
