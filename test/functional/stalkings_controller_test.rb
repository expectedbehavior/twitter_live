require 'test_helper'

class StalkingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stalkings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stalking" do
    assert_difference('Stalking.count') do
      post :create, :stalking => { }
    end

    assert_redirected_to stalking_path(assigns(:stalking))
  end

  test "should show stalking" do
    get :show, :id => stalkings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stalkings(:one).to_param
    assert_response :success
  end

  test "should update stalking" do
    put :update, :id => stalkings(:one).to_param, :stalking => { }
    assert_redirected_to stalking_path(assigns(:stalking))
  end

  test "should destroy stalking" do
    assert_difference('Stalking.count', -1) do
      delete :destroy, :id => stalkings(:one).to_param
    end

    assert_redirected_to stalkings_path
  end
end
