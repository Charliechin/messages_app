class AddMentionToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :mentions, :string
  end
end
