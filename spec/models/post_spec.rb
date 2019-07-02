require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

end
