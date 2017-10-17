class RenameDescriptionToBody < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :description, :body
  end
end
