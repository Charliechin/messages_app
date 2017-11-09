class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :sender
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
