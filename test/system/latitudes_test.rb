require "application_system_test_case"

class LatitudesTest < ApplicationSystemTestCase
  setup do
    @latitude = latitudes(:one)
  end

  test "visiting the index" do
    visit latitudes_url
    assert_selector "h1", text: "Latitudes"
  end

  test "should create latitude" do
    visit latitudes_url
    click_on "New latitude"

    fill_in "Externa", with: @latitude.externa_id
    fill_in "Longitude", with: @latitude.longitude
    fill_in "Mag type", with: @latitude.mag_type
    fill_in "Magnitude", with: @latitude.magnitude
    fill_in "Place", with: @latitude.place
    fill_in "Time", with: @latitude.time
    fill_in "Title", with: @latitude.title
    check "Tsunami" if @latitude.tsunami
    fill_in "Type", with: @latitude.type
    click_on "Create Latitude"

    assert_text "Latitude was successfully created"
    click_on "Back"
  end

  test "should update Latitude" do
    visit latitude_url(@latitude)
    click_on "Edit this latitude", match: :first

    fill_in "Externa", with: @latitude.externa_id
    fill_in "Longitude", with: @latitude.longitude
    fill_in "Mag type", with: @latitude.mag_type
    fill_in "Magnitude", with: @latitude.magnitude
    fill_in "Place", with: @latitude.place
    fill_in "Time", with: @latitude.time
    fill_in "Title", with: @latitude.title
    check "Tsunami" if @latitude.tsunami
    fill_in "Type", with: @latitude.type
    click_on "Update Latitude"

    assert_text "Latitude was successfully updated"
    click_on "Back"
  end

  test "should destroy Latitude" do
    visit latitude_url(@latitude)
    click_on "Destroy this latitude", match: :first

    assert_text "Latitude was successfully destroyed"
  end
end
