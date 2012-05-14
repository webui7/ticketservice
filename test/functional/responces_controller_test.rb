require 'test_helper'

class ResponcesControllerTest < ActionController::TestCase
  setup do
    @responce = responces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create responce" do
    assert_difference('Responce.count') do
      post :create, responce: @responce.attributes
    end

    assert_redirected_to responce_path(assigns(:responce))
  end

  test "should show responce" do
    get :show, id: @responce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @responce
    assert_response :success
  end

  test "should update responce" do
    put :update, id: @responce, responce: @responce.attributes
    assert_redirected_to responce_path(assigns(:responce))
  end

  test "should destroy responce" do
    assert_difference('Responce.count', -1) do
      delete :destroy, id: @responce
    end

    assert_redirected_to responces_path
  end
end
