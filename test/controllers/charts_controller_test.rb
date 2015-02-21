require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  setup do
    @chart = charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charts)
  end

  test "should create chart" do
    assert_difference('Chart.count') do
      post :create, chart: { count: @chart.count, max: @chart.max, min: @chart.min }
    end

    assert_response 201
  end

  test "should show chart" do
    get :show, id: @chart
    assert_response :success
  end

  test "should update chart" do
    put :update, id: @chart, chart: { count: @chart.count, max: @chart.max, min: @chart.min }
    assert_response 204
  end

  test "should destroy chart" do
    assert_difference('Chart.count', -1) do
      delete :destroy, id: @chart
    end

    assert_response 204
  end
end
