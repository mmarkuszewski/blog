require 'rails_helper'

RSpec.describe Comment, type: :model do
  # let(:post) { Post.new(title:"title", content: "something") }
  # let(:user) { User.new(name: "owner", password: "password", role: "user") }
  # subject { described_class.new(content: "something", post: post, user: user) }

  describe "Validations" do
    it { should validate_presence_of(:content) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

end
