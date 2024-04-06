require "test_helper"

class LatitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @latitude = latitudes(:one)
  end

  test "should get index" do
    get latitudes_url
    assert_response :success
  end

  test "should get new" do
    get new_latitude_url
    assert_response :success
  end

  test "should create latitude" do
    assert_difference("Latitude.count") do
      post latitudes_url, params: { latitude: { externa_id: @latitude.externa_id, longitude: @latitude.longitude, mag_type: @latitude.mag_type, magnitude: @latitude.magnitude, place: @latitude.place, time: @latitude.time, title: @latitude.title, tsunami: @latitude.tsunami, type: @latitude.type } }
    end

    assert_redirected_to latitude_url(Latitude.last)
  end

  test "should show latitude" do
    get latitude_url(@latitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_latitude_url(@latitude)
    assert_response :success
  end

  test "should update latitude" do
    patch latitude_url(@latitude), params: { latitude: { externa_id: @latitude.externa_id, longitude: @latitude.longitude, mag_type: @latitude.mag_type, magnitude: @latitude.magnitude, place: @latitude.place, time: @latitude.time, title: @latitude.title, tsunami: @latitude.tsunami, type: @latitude.type } }
    assert_redirected_to latitude_url(@latitude)
  end

  test "should destroy latitude" do
    assert_difference("Latitude.count", -1) do
      delete latitude_url(@latitude)
    end

    assert_redirected_to latitudes_url
  end
end
