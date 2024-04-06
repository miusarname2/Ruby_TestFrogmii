require "application_system_test_case"

class EarthquakesTest < ApplicationSystemTestCase
  setup do
    @earthquake = earthquakes(:one)
  end

  test "visiting the index" do
    visit earthquakes_url
    assert_selector "h1", text: "Earthquakes"
  end

  test "should create earthquake" do
    visit earthquakes_url
    click_on "New earthquake"

    fill_in "Externa", with: @earthquake.externa_id
    fill_in "Latitude", with: @earthquake.latitude
    fill_in "Longitude", with: @earthquake.longitude
    fill_in "Mag type", with: @earthquake.mag_type
    fill_in "Magnitude", with: @earthquake.magnitude
    fill_in "Place", with: @earthquake.place
    fill_in "Time", with: @earthquake.time
    fill_in "Title", with: @earthquake.title
    check "Tsunami" if @earthquake.tsunami
    fill_in "Type", with: @earthquake.type
    click_on "Create Earthquake"

    assert_text "Earthquake was successfully created"
    click_on "Back"
  end

  test "should update Earthquake" do
    visit earthquake_url(@earthquake)
    click_on "Edit this earthquake", match: :first

    fill_in "Externa", with: @earthquake.externa_id
    fill_in "Latitude", with: @earthquake.latitude
    fill_in "Longitude", with: @earthquake.longitude
    fill_in "Mag type", with: @earthquake.mag_type
    fill_in "Magnitude", with: @earthquake.magnitude
    fill_in "Place", with: @earthquake.place
    fill_in "Time", with: @earthquake.time
    fill_in "Title", with: @earthquake.title
    check "Tsunami" if @earthquake.tsunami
    fill_in "Type", with: @earthquake.type
    click_on "Update Earthquake"

    assert_text "Earthquake was successfully updated"
    click_on "Back"
  end

  test "should destroy Earthquake" do
    visit earthquake_url(@earthquake)
    click_on "Destroy this earthquake", match: :first

    assert_text "Earthquake was successfully destroyed"
  end
end
