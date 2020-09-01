class AddFilesystemIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :filesystem_id, :integer
  end
end
