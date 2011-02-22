require 'test_helper'

class OfcarsControllerTest < ActionController::TestCase
  setup do
    @ofcar = ofcars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ofcars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ofcar" do
    assert_difference('Ofcar.count') do
      post :create, :ofcar => @ofcar.attributes
    end

    assert_redirected_to ofcar_path(assigns(:ofcar))
  end

  test "should show ofcar" do
    get :show, :id => @ofcar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ofcar.to_param
    assert_response :success
  end

  test "should update ofcar" do
    put :update, :id => @ofcar.to_param, :ofcar => @ofcar.attributes
    assert_redirected_to ofcar_path(assigns(:ofcar))
  end

  test "should destroy ofcar" do
    assert_difference('Ofcar.count', -1) do
      delete :destroy, :id => @ofcar.to_param
    end

    assert_redirected_to ofcars_path
  end
end
