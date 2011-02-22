require 'test_helper'

class CuentasControllerTest < ActionController::TestCase
  setup do
    @cuenta = cuentas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuenta" do
    assert_difference('Cuenta.count') do
      post :create, :cuenta => @cuenta.attributes
    end

    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  test "should show cuenta" do
    get :show, :id => @cuenta.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cuenta.to_param
    assert_response :success
  end

  test "should update cuenta" do
    put :update, :id => @cuenta.to_param, :cuenta => @cuenta.attributes
    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  test "should destroy cuenta" do
    assert_difference('Cuenta.count', -1) do
      delete :destroy, :id => @cuenta.to_param
    end

    assert_redirected_to cuentas_path
  end
end
