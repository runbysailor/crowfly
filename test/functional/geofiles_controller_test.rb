require 'test_helper'

class GeofilesControllerTest < ActionController::TestCase
  setup do
    @geodata = geofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geodata" do
    assert_difference('Geodata.count') do
      post :create, :geodata => @geodata.attributes
    end

    assert_redirected_to geodata_path(assigns(:geodata))
  end

  test "should show geodata" do
    get :show, :id => @geodata.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @geodata.to_param
    assert_response :success
  end

  test "should update geodata" do
    put :update, :id => @geodata.to_param, :geodata => @geodata.attributes
    assert_redirected_to geodata_path(assigns(:geodata))
  end

  test "should destroy geodata" do
    assert_difference('Geodata.count', -1) do
      delete :destroy, :id => @geodata.to_param
    end

    assert_redirected_to geofiles_path
  end
end
