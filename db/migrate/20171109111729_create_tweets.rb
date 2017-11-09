class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :sender
      t.text :body
      t.text :expanded_body

      t.timestamps
    end
  end
end
