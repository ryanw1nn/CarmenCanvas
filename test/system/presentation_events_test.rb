require "application_system_test_case"

class PresentationEventsTest < ApplicationSystemTestCase
  setup do
    @presentation_event = presentation_events(:one)
  end

  test "visiting the index" do
    visit presentation_events_url
    assert_selector "h1", text: "Presentation events"
  end

  test "should create presentation event" do
    visit presentation_events_url
    click_on "New presentation event"

    fill_in "Date", with: @presentation_event.date
    fill_in "Description", with: @presentation_event.description
    fill_in "Title", with: @presentation_event.title
    click_on "Create Presentation event"

    assert_text "Presentation event was successfully created"
    click_on "Back"
  end

  test "should update Presentation event" do
    visit presentation_event_url(@presentation_event)
    click_on "Edit this presentation event", match: :first

    fill_in "Date", with: @presentation_event.date
    fill_in "Description", with: @presentation_event.description
    fill_in "Title", with: @presentation_event.title
    click_on "Update Presentation event"

    assert_text "Presentation event was successfully updated"
    click_on "Back"
  end

  test "should destroy Presentation event" do
    visit presentation_event_url(@presentation_event)
    click_on "Destroy this presentation event", match: :first

    assert_text "Presentation event was successfully destroyed"
  end
end
