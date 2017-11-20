class AddQuarantineToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :in_quarantine, :bool
  end
end
