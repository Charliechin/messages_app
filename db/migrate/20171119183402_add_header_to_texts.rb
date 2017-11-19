class AddHeaderToTexts < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :header, :text
    add_column :tweets, :header, :text
    add_column :emails, :header, :text
  end
end
