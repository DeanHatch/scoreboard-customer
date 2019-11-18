require 'test_helper'

class CreditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:happyCustomer)
    @credit = credits(:hcone)
  end

  test "should get index" do
    get customer_credits_url(@customer)
    assert_response :success
  end

  test "should get new" do
    get new_customer_credit_url(@customer)
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post customer_credits_url(@customer),
        params: { credit: { customer_id: @credit.customer_id, origin: "Test Credit" } }
    end

    assert_redirected_to credit_url(Credit.last)
  end

  test "should show credit" do
    get credit_url(@credit)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_url(@credit)
    assert_response :success
  end

  test "should update credit" do
    patch credit_url(@credit), params: { credit: { customer_id: @credit.customer_id, origin: @credit.origin } }
    assert_redirected_to credit_url(@credit)
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete credit_url(@credit)
    end

    assert_redirected_to customer_credits_url(@customer)
  end
end
