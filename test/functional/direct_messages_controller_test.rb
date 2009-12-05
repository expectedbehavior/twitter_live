require 'test_helper'

class DirectMessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:direct_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direct_message" do
    assert_difference('DirectMessage.count') do
      post :create, :direct_message => { }
    end

    assert_redirected_to direct_message_path(assigns(:direct_message))
  end

  test "should show direct_message" do
    get :show, :id => direct_messages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => direct_messages(:one).to_param
    assert_response :success
  end

  test "should update direct_message" do
    put :update, :id => direct_messages(:one).to_param, :direct_message => { }
    assert_redirected_to direct_message_path(assigns(:direct_message))
  end

  test "should destroy direct_message" do
    assert_difference('DirectMessage.count', -1) do
      delete :destroy, :id => direct_messages(:one).to_param
    end

    assert_redirected_to direct_messages_path
  end
end
