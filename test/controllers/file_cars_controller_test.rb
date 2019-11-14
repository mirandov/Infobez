require 'test_helper'

class FileCarsControllerTest < ActionController::TestCase
  setup do
    @file_car = file_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_car" do
    assert_difference('FileCar.count') do
      post :create, file_car: {  }
    end

    assert_redirected_to file_car_path(assigns(:file_car))
  end

  test "should show file_car" do
    get :show, id: @file_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_car
    assert_response :success
  end

  test "should update file_car" do
    patch :update, id: @file_car, file_car: {  }
    assert_redirected_to file_car_path(assigns(:file_car))
  end

  test "should destroy file_car" do
    assert_difference('FileCar.count', -1) do
      delete :destroy, id: @file_car
    end

    assert_redirected_to file_cars_path
  end
end
