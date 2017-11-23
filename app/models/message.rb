class Message < ApplicationRecord
  validates :sender, presence: true
end
