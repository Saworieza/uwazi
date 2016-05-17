class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :contestType
      t.string :location_type
      t.string :code

      t.timestamps null: false
    end
  end
end
