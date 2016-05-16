class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.date :founded
      t.string :abbrev

      t.timestamps null: false
    end
  end
end
