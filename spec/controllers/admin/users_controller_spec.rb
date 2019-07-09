require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) {create(:admin)}


  describe 'GET #index' do
    context "as admin" do
      before { sign_in admin }
      let(:user) { create :user }

      it "should show all users" do
        get :index
        expect(assigns(:users)).to eq([admin,user])
      end
    end
    context "as user/guest" do
      it "redirect to main page" do
        get :index
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "DELETE #destroy" do
    context "as admin" do
      before { sign_in admin }
      let(:user) { create :user }

      it "should destroy user" do
        get :destroy, params: { id: user.id }
        expect(User.count).to eq(1)
      end
    end
    context "as user/guest" do
      it "redirect to main page" do
        get :destroy, params: { id: admin.id }
        expect(response).to redirect_to(root_url)
      end
    end

  end
end