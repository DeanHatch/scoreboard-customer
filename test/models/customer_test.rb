require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "adding a customer must also add its organization" do
    #assert_difference('Organization.count') do
    assert_difference('Customer.count') do
      Customer.create(email: "drh@drh.org")
    end
  end

end
