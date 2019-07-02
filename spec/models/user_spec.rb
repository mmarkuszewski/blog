require 'rails_helper'
require "cancan/matchers"


RSpec.describe User, type: :model do
  subject { described_class.create(name: "someone", password: "password", role: "user") }

  describe "associations" do
    it { should have_many(:comments) }
  end

  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }

    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with too short password" do
      subject.password = "passw"
      expect(subject).to_not be_valid
    end

    it "is not valid without name uniqueness" do
      subject.save
      user = User.new(name: "someone", password: "password", role: "user")
      expect(user).to_not be_valid
    end
  end

  it "is admin" do
    subject.role = "admin"
    expect(subject.is_admin?).to eq(true)
  end

  describe "abilities" do
    let(:ability) { Ability.new(subject) }
    context "with admin role" do
      before { subject.role = "admin" }
      it { expect(ability).to be_able_to(:manage, Post.new()) }
    end

    it { expect(ability).to be_able_to(:create, Comment.new()) }
    it { expect(ability).to be_able_to(:edit, Comment.new(user: subject)) }
    it { expect(ability).to be_able_to(:destroy, Comment.new(user: subject)) }

    it { expect(ability).to_not be_able_to(:manage, Post.new()) }

    context "guest" do
      before { subject.id = nil }
      it { expect(ability).to_not be_able_to(:create, Comment.new()) }
      it { expect(ability).to_not be_able_to(:edit, Comment.new(user: subject)) }
      it { expect(ability).to_not be_able_to(:destroy, Comment.new(user: subject)) }

      it { expect(ability).to_not be_able_to(:manage, Post.new()) }
      it { expect(ability).to be_able_to(:read, Post.new()) }
    end
  end

end