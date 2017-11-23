require 'rails_helper'

RSpec.describe Email, type: :model do
  before(:each) do
    @email = Email.new(
      sender: "john@example.com" ,
      subject: "Lorem Ipsum" ,
      body: "body of the dummy email",
      header: "E123456789"
    )
    @sir_email = Email.new(
      sender: "john@example.com" ,
      subject: "Lorem Ipsum" ,
      body: "body of the dummy email",
      header: "E123456789",
      incident: "Terrorism",
      centre_code: "12-32-222"
    )
  end
  it "is valid with sender, subject, body, header" do
    expect(@email).to be_valid
  end

  it "is invalid without a sender" do
    email = Email.new(
      subject: "Lorem Ipsum" ,
      body: "body of the dummy email",
      header: "E123456789"
    )
    expect(email).to be_invalid
  end

  it "is invalid without a subject" do
    email = Email.new(
      sender: "john@example.com" ,
      body: "body of the dummy email",
      header: "E123456789"
    )
    expect(email).to be_invalid
  end

  it "is invalid without a body" do
    email = Email.new(
      sender: "john@example.com" ,
      subject: "Lorem Ipsum" ,
      header: "E123456789"
    )
    expect(email).to be_invalid
  end

  it "changes url to <URL Quarantined>" do
    @email.update(body: "Lorem Ipsum http://www.example.com")
    expect(@email.body).to eq("Lorem Ipsum <URL Quarantined>")
    expect(@email.in_quarantine).to eq(true)
  end

  it "is standard email without SIR <date> in subject" do
    @email.save
    expect(@email.is_standard).to eq(true)
  end
  it "is not standard email with SIR <date> in subject" do
    @email.update(subject: "SIR 22/08/1986")
    expect(@email.is_standard).to eq(false)
  end
end
