class AddCentreCodeToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :centre_code, :text
  end
end
