class AddExpandedTextToText < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :expanded_body, :text
  end
end
