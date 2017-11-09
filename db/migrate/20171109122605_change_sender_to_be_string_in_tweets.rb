class ChangeSenderToBeStringInTweets < ActiveRecord::Migration[5.1]
  def change
    change_column :tweets, :sender, :string
  end
end
