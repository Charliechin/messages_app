require "rails_helper"

RSpec.feature "User creates a new message" do
  before do
    visit "/"
  end

  context "with valid attributes" do

    it "sends a text when a phone number is filled in"
    #    fill_in "Sender", with: "555-555-555"
    #    fill_in "Body", with: "This is body"
    #    click_button "Send it"

    #    expect(page).to have_content "SMS has been sent."

    it "sends user to tweet view when a twitter account is filled in"
    it "sends user to email view when an email is filled in"
  end
end
