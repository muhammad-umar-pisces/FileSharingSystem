class Add < ActiveRecord::Migration[5.2]
  def change
  	 add_column :filesystems, :visit_counter, :integer
  end
end
