class AddUserIdToFilesystem < ActiveRecord::Migration[5.2]
  def change
    add_column :filesystems, :user_id, :integer
  end
end
