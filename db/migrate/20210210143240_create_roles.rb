class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.timestamps
    end
  end
end
