require "rails_helper"

RSpec.feature "Users can create general messages" do

  before do
    visit new_messages_tweet_path
  end

  context "with valid attributes: " do

    it "sends a tweet without abbreviations, hashtags nor mentions successfully" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "lorem ipsum"
      click_button "Create Tweet"

      expect(Tweet.last.sender).to have_content "@duderino"
      expect(Tweet.last.body).to have_content "lorem ipsum"
      expect(page).to have_content "Tweet has been sent."
    end

    it "sends a tweet with abbreviations successfully" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "lorem ipsum LOL"
      click_button "Create Tweet"

      expect(Tweet.first.sender).to eq("@duderino")
      expect(Tweet.first.expanded_body[-1]).to have_content ">"
      expect(page).to have_content "Tweet has been sent."
    end

    it "sends a tweet with abbreviations & hashtags successfully" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "#hello lorem ipsum LOL"
      click_button "Create Tweet"

      expect(Tweet.first.sender).to eq("@duderino")
      expect(Tweet.first.expanded_body[-1]).to have_content ">"
      expect(Tweet.first.hashtag[0]).to have_content "#hello"
      expect(page).to have_content "Tweet has been sent."
    end


    it "sends a tweet with abbreviations, hashtags & mentions successfully" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "#hello @johnny lorem ipsum LOL"
      click_button "Create Tweet"

      expect(Tweet.first.sender).to eq("@duderino")
      expect(Tweet.first.expanded_body[-1]).to have_content ">"
      expect(Tweet.first.hashtag[0]).to have_content "#hello"
      expect(Tweet.first.mentions[0]).to have_content "@johnny"
      expect(page).to have_content "Tweet has been sent."
    end


    it "displays a mention/hashtag list after a tweet has been sent" do
      fill_in "Sender", with: "@duderino"
      fill_in "Body", with: "#hello @johnny lorem ipsum LOL"
      click_button "Create Tweet"

      expect(page).to have_css "#hashtag-list"
      expect(page).to have_css "#mentions-list"
    end

  end
end
