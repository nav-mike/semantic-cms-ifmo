require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #abit' do
    it 'returns http success' do
      get :abit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #student' do
    it 'returns http success' do
      get :student
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #graduate' do
    it 'returns http success' do
      get :graduate
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #history' do
    it 'returns http success' do
      get :history
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #staff' do
    it 'returns http success' do
      get :staff
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #contacts' do
    it 'returns http success' do
      get :contacts
      expect(response).to have_http_status(:success)
    end
  end
end
