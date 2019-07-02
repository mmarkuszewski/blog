require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @admin = users(:admin)
  end

  test "admin" do
    assert @admin.is_admin?
  end
end
