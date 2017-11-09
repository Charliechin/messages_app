class AddHastagToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :hashtag, :string
  end
end
