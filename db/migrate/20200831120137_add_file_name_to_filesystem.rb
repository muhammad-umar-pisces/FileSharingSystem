class AddFileNameToFilesystem < ActiveRecord::Migration[5.2]
  def change
    add_column :filesystems, :file_name, :string
  end
end
