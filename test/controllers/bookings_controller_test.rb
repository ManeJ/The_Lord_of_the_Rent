require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get indexnew" do
    get bookings_indexnew_url
    assert_response :success
  end

  test "should get create" do
    get bookings_create_url
    assert_response :success
  end

  test "should get show" do
    get bookings_show_url
    assert_response :success
  end

  test "should get delete" do
    get bookings_delete_url
    assert_response :success
  end

end
