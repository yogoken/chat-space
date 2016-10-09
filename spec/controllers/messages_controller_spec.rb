require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      # get :index
      # expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      # get :create, message: { body: 'sample' }
      # expect(response).to have_http_status(:found)
      # expect(response).to redirect_to(messages_path)
    end
  end
end
