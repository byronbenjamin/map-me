require 'test_helper'

class FutureTripsControllerTest < ActionController::TestCase
  setup do
    @future_trip = future_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:future_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create future_trip" do
    assert_difference('FutureTrip.count') do
      post :create, future_trip: {  }
    end

    assert_redirected_to future_trip_path(assigns(:future_trip))
  end

  test "should show future_trip" do
    get :show, id: @future_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @future_trip
    assert_response :success
  end

  test "should update future_trip" do
    patch :update, id: @future_trip, future_trip: {  }
    assert_redirected_to future_trip_path(assigns(:future_trip))
  end

  test "should destroy future_trip" do
    assert_difference('FutureTrip.count', -1) do
      delete :destroy, id: @future_trip
    end

    assert_redirected_to future_trips_path
  end
end
