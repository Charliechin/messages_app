require 'rails_helper'

RSpec.describe Message, type: :model do

  it "is valid with sender" do
    message = Message.new(sender: "hello")
    expect(message).to be_valid
  end

  it "is invalid without a sender" do
    message = Message.new
    expect(message).to be_invalid
  end

end
