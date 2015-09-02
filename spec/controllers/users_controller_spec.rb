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
    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    it 'returns http success' do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #delete' do
    it 'returns http success' do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end
end
