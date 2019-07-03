require 'rails_helper'
require "cancan/matchers"


RSpec.describe User, type: :model do

  describe "associations" do
    it { should have_many(:comments) }
  end

  describe "validation" do
    it { should validate_presence_of(:role) }
  end

  context "with admin role" do
    subject { create :admin }
    it "is admin" do
      expect(subject.is_admin?).to eq(true)
    end
  end

  describe "abilities" do
    context "with admin role" do
      subject { create :admin }
      let(:ability) { Ability.new(subject) }
      it { expect(ability).to be_able_to(:manage, Post.new()) }
    end

    context "as normal user" do
      subject { create :user }
      let(:ability) { Ability.new(subject) }
      it { expect(ability).to be_able_to(:create, Comment.new()) }
      it { expect(ability).to be_able_to(:edit, Comment.new(user: subject)) }
      it { expect(ability).to be_able_to(:destroy, Comment.new(user: subject)) }

      it { expect(ability).to_not be_able_to(:manage, Post.new()) }
    end

    context "as guest" do
      subject { build :user }
      let(:ability) { Ability.new(subject) }
      it { expect(ability).to_not be_able_to(:create, Comment.new()) }
      it { expect(ability).to_not be_able_to(:edit, Comment.new(user: subject)) }
      it { expect(ability).to_not be_able_to(:destroy, Comment.new(user: subject)) }

      it { expect(ability).to_not be_able_to(:manage, Post.new()) }
      it { expect(ability).to be_able_to(:read, Post.new()) }
    end
  end

end