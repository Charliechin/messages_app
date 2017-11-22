require "rails_helper"

RSpec.feature "User fill in sender text box" do
  before do
    visit "/"
  end

  context "with valid attributes: " do

    it "sends user to text view  when a phone number is filled in" do
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
  context "with invalid attributes" do
    it "redirect redirects user to same page" do
      fill_in "Sender", with: "foobar"
      click_button "Create Message"

      expect(page).to have_current_path("/messages")
    end
  end
end
