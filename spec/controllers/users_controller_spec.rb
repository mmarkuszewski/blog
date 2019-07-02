require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'should success and render to new page' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:user) { create :admin }
    it 'should success and render to edit page' do
      get :edit, params: {id: user.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

end
