require 'test_helper'

class Rc4ProgramsControllerTest < ActionController::TestCase
  setup do
    @rc4_program = rc4_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rc4_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rc4_program" do
    assert_difference('Rc4Program.count') do
      post :create, rc4_program: { chanted_message: @rc4_program.chanted_message, key: @rc4_program.key, message_text: @rc4_program.message_text, transient_message: @rc4_program.transient_message }
    end

    assert_redirected_to rc4_program_path(assigns(:rc4_program))
  end

  test "should show rc4_program" do
    get :show, id: @rc4_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rc4_program
    assert_response :success
  end

  test "should update rc4_program" do
    patch :update, id: @rc4_program, rc4_program: { chanted_message: @rc4_program.chanted_message, key: @rc4_program.key, message_text: @rc4_program.message_text, transient_message: @rc4_program.transient_message }
    assert_redirected_to rc4_program_path(assigns(:rc4_program))
  end

  test "should destroy rc4_program" do
    assert_difference('Rc4Program.count', -1) do
      delete :destroy, id: @rc4_program
    end

    assert_redirected_to rc4_programs_path
  end
end
