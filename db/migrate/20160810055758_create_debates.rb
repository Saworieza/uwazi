class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title

      t.timestamps null: false
    end
    add_column :debates, :category_id, :integer
    add_column :debates, :user_id, :integer
    add_column :categories, :user_id, :integer
  end
end
