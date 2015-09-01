require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  routes { Workspace::Application.routes }
  login_user

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
