class ChangeColumnTypeInEmails < ActiveRecord::Migration[5.1]
  def change
    change_column :texts, :sender, :string
    change_column :emails, :in_quarantine, :boolean
  end
end
