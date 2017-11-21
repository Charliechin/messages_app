class ChangeSenderToBeStringInTweets < ActiveRecord::Migration[5.1]
  def change
    change_column :texts, :sender, :string
  end
end
