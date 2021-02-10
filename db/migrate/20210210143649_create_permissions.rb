class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.integer :role_id, null: false, default: 0
      t.integer :user_id, null: false, default: 0
      t.timestamps
    end
  end
end
