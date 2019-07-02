require 'rails_helper'
require 'support/spec_test_helper'

RSpec.describe PostsController, type: :controller do
  include SpecTestHelper

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

  describe 'GET #new' do
    before {login_admin}
    let(:post) { create :post }
    it 'should success and render to new page' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before {login_admin}
    let(:post) { create :post }
    it 'should success and render to edit page' do
      get :edit, params: {id: post.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "as admin" do
      before { login_admin }

      it "create new post" do
        post :create, params: {post: {title: "title", content: "content"}}
        expect(Post.count).to eq(1)
      end

      it "return new if post is invalid" do
        post :create, params: {post: {title: "", content: "content"}}
        expect(response).to render_template(:new)
      end

      it "return index if post is valid" do
        post :create, params: {post: {title: "title", content: "content"}}
        expect(response).to redirect_to(root_url)
      end
    end

    context "as user" do
      before { login_user }

      it "redirect to main page" do
        post :create, params: {post: {title: "title", content: "content"}}
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'PATCH #update' do
    let(:post) { create :post }
    context "as admin" do
      before { login_admin }

      it "update post" do
        patch :update, params: {id: post.id, post: {title: "edited", content: "content"}}
        expect(Post.first.title).to eq("edited")
      end

      it "return edit if post wasn't updated" do
        patch :update, params: {id: post.id, post: {title: "", content: "content"}}
        expect(response).to render_template(:edit)
      end

      it "return index if post was updated" do
        patch :update, params: {id: post.id, post: {title: "title", content: "content"}}
        expect(response).to redirect_to(root_url)
      end
    end

    context "as user" do
      before { login_user }

      it "redirect to main page" do
        patch :update, params: {id: post.id, post: { title: "title", content: "content"}}
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:post) { create :post }
    context "as admin" do
      before { login_admin }

      it "delete post" do
        delete :destroy, params: { id: post.id }
        expect(Post.count).to eq(0)
      end

      it "return index if post was deleted" do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(root_url)
      end
    end

    context "as user" do
      before { login_user }

      it "redirect to main page" do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(root_url)
      end
    end
  end

end
