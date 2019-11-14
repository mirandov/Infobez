require 'test_helper'

class PeopleFileCarsControllerTest < ActionController::TestCase
  setup do
    @people_file_car = people_file_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_file_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_file_car" do
    assert_difference('PeopleFileCar.count') do
      post :create, people_file_car: { file_car_id: @people_file_car.file_car_id, person_id: @people_file_car.person_id }
    end

    assert_redirected_to people_file_car_path(assigns(:people_file_car))
  end

  test "should show people_file_car" do
    get :show, id: @people_file_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_file_car
    assert_response :success
  end

  test "should update people_file_car" do
    patch :update, id: @people_file_car, people_file_car: { file_car_id: @people_file_car.file_car_id, person_id: @people_file_car.person_id }
    assert_redirected_to people_file_car_path(assigns(:people_file_car))
  end

  test "should destroy people_file_car" do
    assert_difference('PeopleFileCar.count', -1) do
      delete :destroy, id: @people_file_car
    end

    assert_redirected_to people_file_cars_path
  end
end
