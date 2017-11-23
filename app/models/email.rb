class Email < ApplicationRecord
  before_save :check_urls, :check_priority

  validates :sender, presence: true
  validates :subject, presence: true
  validates :body, presence: true



  private
  def check_urls
    #checks Url in the body of the email
    to_be_quarantined = self.body.scan(/https?:\/\/[\S]+/)
    if to_be_quarantined == []
      self.in_quarantine = false
    else
      temp_body = []
      temp_body = self.body.split(" ")
      temp_body.each_with_index do |word,i|
        if word.scan(/https?:\/\/[\S]+/) != []
          temp_body[i] = "<URL Quarantined>"
          self.in_quarantine = true
          self.body = temp_body.join(" ")
        end
      end
    end
  end
  def check_priority
    if self.subject.include?("SIR")
      self.body.prepend("Sport Centre Code: #{self.centre_code}\n Nature of Incident: #{self.incident}\n\n")
      self.is_standard = false
    else
      self.is_standard = true
      self.incident = ""
      self.centre_code = ""
    end
  end
end

