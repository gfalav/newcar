require 'test_helper'

class ContratistasControllerTest < ActionController::TestCase
  setup do
    @contratista = contratistas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratistas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contratista" do
    assert_difference('Contratista.count') do
      post :create, :contratista => @contratista.attributes
    end

    assert_redirected_to contratista_path(assigns(:contratista))
  end

  test "should show contratista" do
    get :show, :id => @contratista.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contratista.to_param
    assert_response :success
  end

  test "should update contratista" do
    put :update, :id => @contratista.to_param, :contratista => @contratista.attributes
    assert_redirected_to contratista_path(assigns(:contratista))
  end

  test "should destroy contratista" do
    assert_difference('Contratista.count', -1) do
      delete :destroy, :id => @contratista.to_param
    end

    assert_redirected_to contratistas_path
  end
end
