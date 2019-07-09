require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) {create(:user)}
  let(:admin) {create(:admin)}
  let(:article) {create(:post)}


  describe 'POST #create' do
    before { sign_in user }

    it "create new comment" do
      post :create, params: {post_id: article.id, post: {comment: {content: "content"}}}
      expect(Comment.count).to eq(1)
    end
  end

  describe 'PATCH #update' do
    let(:comment) { create :comment, user: user, post: article}

    it "update comment" do
      sign_in user
      patch :update, params: {id: comment.id, post_id: article.id, comment: { content: "updated"}}
      expect(Comment.first.content).to eq("updated")
    end

    it "doesn't update someone else's comment" do
      sign_in admin
      patch :update, params: {id: comment.id, post_id: article.id, comment: { content: "updated"}}
      expect(Comment.first.content).to eq("something")
    end
  end

  describe 'DELETE #destroy' do
    let(:comment) { create :comment, user: user, post: article}

    it "delete comment" do
      sign_in user
      delete :destroy, params: {id: comment.id, post_id: article.id}
      expect(Comment.count).to eq(0)
    end
    it "doesn't delete someone else's comment" do
      sign_in admin
      delete :destroy, params: {id: comment.id, post_id: article.id}
      expect(Comment.count).to eq(1)
    end
  end

end
