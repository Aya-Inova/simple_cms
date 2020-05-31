class AddIndexToSections < ActiveRecord::Migration[6.0]
  def change
    add_index :sections, :page_id

  end
end
