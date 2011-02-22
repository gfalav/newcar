require 'test_helper'

class TvehiculosControllerTest < ActionController::TestCase
  setup do
    @tvehiculo = tvehiculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tvehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tvehiculo" do
    assert_difference('Tvehiculo.count') do
      post :create, :tvehiculo => @tvehiculo.attributes
    end

    assert_redirected_to tvehiculo_path(assigns(:tvehiculo))
  end

  test "should show tvehiculo" do
    get :show, :id => @tvehiculo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tvehiculo.to_param
    assert_response :success
  end

  test "should update tvehiculo" do
    put :update, :id => @tvehiculo.to_param, :tvehiculo => @tvehiculo.attributes
    assert_redirected_to tvehiculo_path(assigns(:tvehiculo))
  end

  test "should destroy tvehiculo" do
    assert_difference('Tvehiculo.count', -1) do
      delete :destroy, :id => @tvehiculo.to_param
    end

    assert_redirected_to tvehiculos_path
  end
end
