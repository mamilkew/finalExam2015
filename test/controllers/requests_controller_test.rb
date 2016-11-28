require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @request1 = requests(:one)
    @request2 = requests(:two)
  end

  test "should get index" do
    get requests_url
    assert_response :success
  end

  test "should get new" do
    get new_request_url
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post requests_url, params: { request: { description: @request1.description, location: @request1.location, status: @request1.status, topic: @request1.topic, user_id: @request1.user_id } }
    end

    assert_redirected_to request_url(Request.last)
  end

  test "should show request" do
    get request_url(@request1)
    assert_response :success
  end

  test "should show request another" do
    get request_url(@request2)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_request_url(@request1)
    assert_response :redirect
  end

  # test "should update request" do
  #   patch request_url(@request), params: { request: { description: @request.description, location: @request.location, status: @request.status, topic: @request.topic, user_id: @request.user_id } }
  #   assert_redirected_to request_url(@request)
  # end

  # test "should destroy request" do
  #   assert_difference('Request.count', -1) do
  #     delete request_url(@request)
  #   end
  #
  #   assert_redirected_to requests_url
  # end
end
