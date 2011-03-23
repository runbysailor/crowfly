require 'test_helper'

class OverlaysControllerTest < ActionController::TestCase
  setup do
    @overlay = overlays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlay" do
    assert_difference('Overlay.count') do
      post :create, :overlay => @overlay.attributes
    end

    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should show overlay" do
    get :show, :id => @overlay.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @overlay.to_param
    assert_response :success
  end

  test "should update overlay" do
    put :update, :id => @overlay.to_param, :overlay => @overlay.attributes
    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should destroy overlay" do
    assert_difference('Overlay.count', -1) do
      delete :destroy, :id => @overlay.to_param
    end

    assert_redirected_to overlays_path
  end
end
