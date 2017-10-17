require "rails_helper"

RSpec.feature "Users can create general messages" do
  scenario "with valid attributes" do
    visit "/"

    click_link "Send a SMS"

    fill_in "Sender", with: "555-555-555"
    fill_in "Body", with: "This is body"

    click_button "Send it"

    expect(page).to have_content "SMS has been sent."
  end
end
