class AddStatusToFilesystem < ActiveRecord::Migration[5.2]
  def change
    add_column :filesystems, :status, :integer, default: 0
  end
end
