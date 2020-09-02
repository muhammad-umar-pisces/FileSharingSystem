class AddVisitCounterToFilesystem < ActiveRecord::Migration[5.2]
  def change
    add_column :filesystems, :visit_counter, :integer, default: 0
  end
end
