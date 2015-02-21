require 'test_helper'

class DatapointsControllerTest < ActionController::TestCase
  setup do
    @datapoint = datapoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datapoints)
  end

  test "should create datapoint" do
    assert_difference('Datapoint.count') do
      post :create, datapoint: { domain: @datapoint.domain, framework: @datapoint.framework, responsetime: @datapoint.responsetime, server: @datapoint.server }
    end

    assert_response 201
  end

  test "should show datapoint" do
    get :show, id: @datapoint
    assert_response :success
  end

  test "should update datapoint" do
    put :update, id: @datapoint, datapoint: { domain: @datapoint.domain, framework: @datapoint.framework, responsetime: @datapoint.responsetime, server: @datapoint.server }
    assert_response 204
  end

  test "should destroy datapoint" do
    assert_difference('Datapoint.count', -1) do
      delete :destroy, id: @datapoint
    end

    assert_response 204
  end
end
