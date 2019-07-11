require 'test_helper'

class ExcessDefinitionsControllerTest < ActionController::TestCase
  setup do
    @excess_definition = excess_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excess_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excess_definition" do
    assert_difference('ExcessDefinition.count') do
      post :create, excess_definition: { d_value: @excess_definition.d_value, h_value: @excess_definition.h_value, i_value: @excess_definition.i_value, v_value: @excess_definition.v_value }
    end

    assert_redirected_to excess_definition_path(assigns(:excess_definition))
  end

  test "should show excess_definition" do
    get :show, id: @excess_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @excess_definition
    assert_response :success
  end

  test "should update excess_definition" do
    patch :update, id: @excess_definition, excess_definition: { d_value: @excess_definition.d_value, h_value: @excess_definition.h_value, i_value: @excess_definition.i_value, v_value: @excess_definition.v_value }
    assert_redirected_to excess_definition_path(assigns(:excess_definition))
  end

  test "should destroy excess_definition" do
    assert_difference('ExcessDefinition.count', -1) do
      delete :destroy, id: @excess_definition
    end

    assert_redirected_to excess_definitions_path
  end
end
