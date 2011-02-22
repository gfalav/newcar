require 'test_helper'

class MovilsControllerTest < ActionController::TestCase
  setup do
    @movil = movils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movil" do
    assert_difference('Movil.count') do
      post :create, :movil => @movil.attributes
    end

    assert_redirected_to movil_path(assigns(:movil))
  end

  test "should show movil" do
    get :show, :id => @movil.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @movil.to_param
    assert_response :success
  end

  test "should update movil" do
    put :update, :id => @movil.to_param, :movil => @movil.attributes
    assert_redirected_to movil_path(assigns(:movil))
  end

  test "should destroy movil" do
    assert_difference('Movil.count', -1) do
      delete :destroy, :id => @movil.to_param
    end

    assert_redirected_to movils_path
  end
end
