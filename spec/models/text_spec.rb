require 'rails_helper'

RSpec.describe Text, type: :model do

  before(:each) do
    @text = Text.new(
      sender: "07462738465",
      body: "This is a text"
    )
  end

  it "is valid with a subject & body" do
    expect(@text).to be_valid
  end

  it "is invalid without a subject & body" do
    text = Text.new
    expect(text).to be_invalid
  end

end
