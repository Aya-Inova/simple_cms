class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.bigint :subject_id
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
    add_foreign_key :pages, :subjects

  end
end
