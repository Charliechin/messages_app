require "rails_helper"

RSpec.feature "User creates a new message" do
  before do
    visit "/"
  end

  context "with valid attributes" do

    it "sends a text when a phone number is filled in" do
      fill_in "Sender", with: "07549273977"
      click_button "Create Message"

      expect(page).to have_css "#text-description"
    end

   it "sends user to tweet view when a twitter account is filled in" do
      fill_in "Sender", with: "@ojete"
      click_button "Create Message"

      expect(page).to have_css "#tweet-description"
    end

    it "sends user to email view when an email is filled in" do
      fill_in "Sender", with: "mail@example.com"
      click_button "Create Message"

      expect(page).to have_css "#email-description"
    end
  end
end
