require 'test_helper'

class KeysControllerTest < ActionController::TestCase
  setup do
    @key = keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key" do
    assert_difference('Key.count') do
      post :create, key: @key.attributes
    end

    assert_redirected_to key_path(assigns(:key))
  end

  test "should show key" do
    get :show, id: @key.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key.to_param
    assert_response :success
  end

  test "should update key" do
    put :update, id: @key.to_param, key: @key.attributes
    assert_redirected_to key_path(assigns(:key))
  end

  test "should destroy key" do
    assert_difference('Key.count', -1) do
      delete :destroy, id: @key.to_param
    end

    assert_redirected_to keys_path
  end
end
