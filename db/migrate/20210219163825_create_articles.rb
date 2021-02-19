class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ''
      t.integer :created_by, :updated_by
      t.timestamps
    end
  end
end
