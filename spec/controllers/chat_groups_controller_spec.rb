require 'rails_helper'

RSpec.describe ChatGroupsController, type: :controller do

context 'without login' do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: chat_group.id }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
