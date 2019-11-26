require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @customer = customers(:happyCustomer)
    #sign_in @customer
    sign_in customers(:happyCustomer)
    puts "Customer: ", @customer.inspect()
    #@request.env["devise.mapping"] = Devise.mappings[:customer]
    #sign_in FactoryBot.create(:admin)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: {  } }
    assert_redirected_to customer_url(@customer)
  end

end
