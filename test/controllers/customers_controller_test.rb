require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    #@customer = customers(:happyCustomer)
    #sign_in @customer
    #puts self.methods.sort.join('  ')
    sign_in customers(:happyCustomer)
    puts "Customer: ", @customer.inspect()
    #puts "current_customer: ", current_customer
    #@request.env["devise.mapping"] = Devise.mappings[:customer]
    #sign_in FactoryBot.create(:admin)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

end
