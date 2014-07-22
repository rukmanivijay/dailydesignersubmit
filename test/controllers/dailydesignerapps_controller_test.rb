require 'test_helper'

class DailydesignerappsControllerTest < ActionController::TestCase
  setup do
    @dailydesignerapp = dailydesignerapps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailydesignerapps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailydesignerapp" do
    assert_difference('Dailydesignerapp.count') do
      post :create, dailydesignerapp: { city: @dailydesignerapp.city, name: @dailydesignerapp.name, sex: @dailydesignerapp.sex, state: @dailydesignerapp.state }
    end

    assert_redirected_to dailydesignerapp_path(assigns(:dailydesignerapp))
  end

  test "should show dailydesignerapp" do
    get :show, id: @dailydesignerapp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailydesignerapp
    assert_response :success
  end

  test "should update dailydesignerapp" do
    patch :update, id: @dailydesignerapp, dailydesignerapp: { city: @dailydesignerapp.city, name: @dailydesignerapp.name, sex: @dailydesignerapp.sex, state: @dailydesignerapp.state }
    assert_redirected_to dailydesignerapp_path(assigns(:dailydesignerapp))
  end

  test "should destroy dailydesignerapp" do
    assert_difference('Dailydesignerapp.count', -1) do
      delete :destroy, id: @dailydesignerapp
    end

    assert_redirected_to dailydesignerapps_path
  end
end
