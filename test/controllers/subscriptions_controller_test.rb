require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get subscriptions_show_url
    assert_response :success
  end

  test "should get tuesday" do
    get subscriptions_tuesday_url
    assert_response :success
  end

  test "should get wednesday" do
    get subscriptions_wednesday_url
    assert_response :success
  end
end
