class AddIndexToPages < ActiveRecord::Migration[6.0]
  def change
    add_index :pages, :subject_id

  end
end
