class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|

      t.column "username",:string, :limit=>25, :after=> "email"

      t.column "first_name", :string, :limit=>25
      t.string "last_name", :limit=>50

      t.string "email", :default=> '', :null=>false
      t.string "hashed_password", :limit=>40
  

      t.timestamps
    end
  end
end
