require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'GET #index' do
    let(:post) { create :post }
    it "should show all posts" do
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:post) { create :post }
    it "should show post" do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
    it 'should success and render to show page' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

end
