class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.bigint :page_id
      t.string :name
      t.integer :position
      t.boolean :visible
      t.string :content_type
      t.text :content
      t.timestamps
    end
    add_foreign_key :sections, :pages

  end
end
