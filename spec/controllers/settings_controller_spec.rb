require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
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

  describe 'GET #edit' do
    let!(:setting) { FactoryGirl.create :setting }

    it 'returns http success' do
      get :edit, id: setting.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    let!(:setting) { FactoryGirl.create :setting }

    it 'redirect to settings url' do
      put :update, setting: {key: Faker::Lorem.word, value: Faker::Lorem.word}, id: setting.id
      expect(response).to redirect_to settings_url
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
