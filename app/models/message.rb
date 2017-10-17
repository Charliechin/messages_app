class Message < ApplicationRecord
  validates :sender, presence: true
  validates :body,   presence: true
end
