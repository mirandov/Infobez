require 'test_helper'

class QuickPowsControllerTest < ActionController::TestCase
  setup do
    @quick_pow = quick_pows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quick_pows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quick_pow" do
    assert_difference('QuickPow.count') do
      post :create, quick_pow: { basis: @quick_pow.basis, exponent: @quick_pow.exponent, result: @quick_pow.result, ring_of_residues: @quick_pow.ring_of_residues }
    end

    assert_redirected_to quick_pow_path(assigns(:quick_pow))
  end

  test "should show quick_pow" do
    get :show, id: @quick_pow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quick_pow
    assert_response :success
  end

  test "should update quick_pow" do
    patch :update, id: @quick_pow, quick_pow: { basis: @quick_pow.basis, exponent: @quick_pow.exponent, result: @quick_pow.result, ring_of_residues: @quick_pow.ring_of_residues }
    assert_redirected_to quick_pow_path(assigns(:quick_pow))
  end

  test "should destroy quick_pow" do
    assert_difference('QuickPow.count', -1) do
      delete :destroy, id: @quick_pow
    end

    assert_redirected_to quick_pows_path
  end
end
