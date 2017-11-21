class AddIsStandardFieldToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :is_standard, :bool
  end
end
