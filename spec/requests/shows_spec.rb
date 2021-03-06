require 'spec_helper'

describe "Shows" do
  it "should be able to add new shows" do
    visit "/"

    page.should have_content("Shows List")

    click_link("New Show")

    page.should have_content("New Show")

    fill_in "Name", :with => "Family Guy"
    fill_in "Picture", :with => "http://somephoto.com"

    click_button "Submit"

    page.should have_content "Shows List"
    page.should have_content "Family Guy"
    page.should have_content "http://somephoto.com"
  end

  it "should be able to view existing shows in seperate" do
    visit "/shows/1"
    page.should have_content("Shows Item")
    page.should have_content "Show ID"
    page.should have_content "Show Name"
    click_link("Shows")
    page.should have_content("Shows List")
  end
end
