require 'dictionary'

class Text < ApplicationRecord
  validates :sender, presence: true
  validates :body, presence: true
end
