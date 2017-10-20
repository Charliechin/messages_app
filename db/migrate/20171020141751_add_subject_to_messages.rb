class AddSubjectToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :subject, :text
  end
end
