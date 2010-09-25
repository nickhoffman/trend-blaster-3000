require 'test_helper'

class CurrencyValuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currency_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currency_value" do
    assert_difference('CurrencyValue.count') do
      post :create, :currency_value => { }
    end

    assert_redirected_to currency_value_path(assigns(:currency_value))
  end

  test "should show currency_value" do
    get :show, :id => currency_values(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => currency_values(:one).to_param
    assert_response :success
  end

  test "should update currency_value" do
    put :update, :id => currency_values(:one).to_param, :currency_value => { }
    assert_redirected_to currency_value_path(assigns(:currency_value))
  end

  test "should destroy currency_value" do
    assert_difference('CurrencyValue.count', -1) do
      delete :destroy, :id => currency_values(:one).to_param
    end

    assert_redirected_to currency_values_path
  end
end
