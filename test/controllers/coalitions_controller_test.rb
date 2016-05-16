require 'test_helper'

class CoalitionsControllerTest < ActionController::TestCase
  setup do
    @coalition = coalitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coalitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coalition" do
    assert_difference('Coalition.count') do
      post :create, coalition: { abbrev: @coalition.abbrev, name: @coalition.name }
    end

    assert_redirected_to coalition_path(assigns(:coalition))
  end

  test "should show coalition" do
    get :show, id: @coalition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coalition
    assert_response :success
  end

  test "should update coalition" do
    patch :update, id: @coalition, coalition: { abbrev: @coalition.abbrev, name: @coalition.name }
    assert_redirected_to coalition_path(assigns(:coalition))
  end

  test "should destroy coalition" do
    assert_difference('Coalition.count', -1) do
      delete :destroy, id: @coalition
    end

    assert_redirected_to coalitions_path
  end
end
