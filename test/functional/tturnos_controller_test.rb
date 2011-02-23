require 'test_helper'

class TturnosControllerTest < ActionController::TestCase
  setup do
    @tturno = tturnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tturnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tturno" do
    assert_difference('Tturno.count') do
      post :create, :tturno => @tturno.attributes
    end

    assert_redirected_to tturno_path(assigns(:tturno))
  end

  test "should show tturno" do
    get :show, :id => @tturno.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tturno.to_param
    assert_response :success
  end

  test "should update tturno" do
    put :update, :id => @tturno.to_param, :tturno => @tturno.attributes
    assert_redirected_to tturno_path(assigns(:tturno))
  end

  test "should destroy tturno" do
    assert_difference('Tturno.count', -1) do
      delete :destroy, :id => @tturno.to_param
    end

    assert_redirected_to tturnos_path
  end
end
