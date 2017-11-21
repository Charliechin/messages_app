class ChangeColumnIsStandardInEmails < ActiveRecord::Migration[5.1]
  def change
    change_column :emails, :is_standard, :boolean
  end
end
