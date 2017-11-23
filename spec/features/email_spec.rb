require "rails_helper"

RSpec.feature "User creates a new message" do
  before(:each) do
    visit new_messages_email_path
  end

  context "with valid attributes: " do

    it "sends a standard email with simple body" do
      fill_in "Sender", with: "john@example.com"
      fill_in "Body", with: "lorem ipsum"
      click_button "Create Email"

      expect(Email.last.sender).to have_content "john@example.com"
      expect(Email.last.body).to have_content "lorem ipsum"
      expect(Email.last.is_standard).to eq(true)
      expect(page).to have_content "Email has been sent."
    end

    it "sends a standard email with url in body" do

      fill_in "Sender", with: "john@example.com"
      fill_in "Body", with: "lorem ipsum http:www.google.com"
      click_button "Create Email"

      expect(Email.first.sender).to have_content "john@example.com"
      expect(Email.first.is_standard).to eq(true)
      expect(page).to have_content "Email has been sent."

    end


    it "displays a SIR list after a Email has been sent" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "#hello @johnny lorem ipsum"
      click_button "Create Email"

      expect(page).to have_css "#sir-list"
    end

  end


end
