class Tweet < ApplicationRecord
  #You can store Arrays and Hashes using ActiveRecord's serialize declaration
  #hashtag field will be treated as an array
  # Tweet.hashtag = ["#Hello","#goodbye"]
  # Tweet.hashtag[0] = "#Hello"

  validates :sender, presence: true
  validates :body, presence: true

  serialize :hashtag
  serialize :mentions
end
