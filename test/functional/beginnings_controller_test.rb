require 'test_helper'

class BeginningsControllerTest < ActionController::TestCase
  setup do
    @beginning = beginnings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beginnings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beginning" do
    assert_difference('Beginning.count') do
      post :create, :beginning => @beginning.attributes
    end

    assert_redirected_to beginning_path(assigns(:beginning))
  end

  test "should show beginning" do
    get :show, :id => @beginning.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @beginning.to_param
    assert_response :success
  end

  test "should update beginning" do
    put :update, :id => @beginning.to_param, :beginning => @beginning.attributes
    assert_redirected_to beginning_path(assigns(:beginning))
  end

  test "should destroy beginning" do
    assert_difference('Beginning.count', -1) do
      delete :destroy, :id => @beginning.to_param
    end

    assert_redirected_to beginnings_path
  end
end
