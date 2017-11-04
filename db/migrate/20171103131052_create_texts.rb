class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.integer :sender
      t.text :body

      t.timestamps
    end
  end
end
