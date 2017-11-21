class AddIncidentToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :incident, :text
  end
end
