require "rails_helper"

RSpec.feature "Users can create general messages" do
  before do
    visit "/"
    click_link "Send a SMS"
  end

  scenario "with valid attributes" do

    fill_in "Sender", with: "555-555-555"
    fill_in "Body", with: "This is body"
    click_button "Send it"

    expect(page).to have_content "SMS has been sent."
  end

  scenario "with invalid attributes" do

    click_button "Send it"

    expect(page).to have_content "Message has not been sent."
    expect(page).to have_content "Sender can't be blank"
    expect(page).to have_content "Body can't be blank"

  end
end
