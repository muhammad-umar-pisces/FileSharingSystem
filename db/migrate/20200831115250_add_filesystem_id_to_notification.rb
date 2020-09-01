class AddFilesystemIdToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :filesystem_id, :integer
  end
end
