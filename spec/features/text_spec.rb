require "rails_helper"

RSpec.feature "Users can create text messages" do

  before do
    visit new_messages_text_path
  end

  context "with valid attributes: " do

    it "sends a text without abbreviations successfully" do
      fill_in "Sender", with: "07549273977"
      fill_in "Body", with: "lorem ipsum"
      click_button "Create Text"
      text_sent = Text.last.body

      expect(text_sent).to have_content "lorem ipsum"
      expect(page).to have_content "SMS has been sent."
    end

    it "sends a text with abbreviations successfully" do
      fill_in "Sender", with: "07549273977"
      fill_in "Body", with: "lorem ipsum LOL"
      click_button "Create Text"
      text_body_expanded_sent = Text.last.expanded_body
      expect(text_body_expanded_sent).to have_content
      expect(page).to have_content "SMS has been sent."
    end
  end

  context "with invalid attributes" do
    it "will not allow the user to continue" do
      click_button "Create Text"
      expect(page).to have_current_path(messages_texts_path)
    end
  end
end
