require 'test_helper'

class AlumnusControllerTest < ActionController::TestCase
  setup do
    @alumnu = alumnus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumnus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumnu" do
    assert_difference('Alumnu.count') do
      post :create, alumnu: { address: @alumnu.address, email: @alumnu.email, firstname: @alumnu.firstname, gradyear: @alumnu.gradyear, lastname: @alumnu.lastname, major: @alumnu.major }
    end

    assert_redirected_to alumnu_path(assigns(:alumnu))
  end

  test "should show alumnu" do
    get :show, id: @alumnu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alumnu
    assert_response :success
  end

  test "should update alumnu" do
    patch :update, id: @alumnu, alumnu: { address: @alumnu.address, email: @alumnu.email, firstname: @alumnu.firstname, gradyear: @alumnu.gradyear, lastname: @alumnu.lastname, major: @alumnu.major }
    assert_redirected_to alumnu_path(assigns(:alumnu))
  end

  test "should destroy alumnu" do
    assert_difference('Alumnu.count', -1) do
      delete :destroy, id: @alumnu
    end

    assert_redirected_to alumnus_path
  end
end
