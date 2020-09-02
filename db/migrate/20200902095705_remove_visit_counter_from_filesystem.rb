class RemoveVisitCounterFromFilesystem < ActiveRecord::Migration[5.2]
  def change
    remove_column :filesystems, :visit_counter, :integer
  end
end
