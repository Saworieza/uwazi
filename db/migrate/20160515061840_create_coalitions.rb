class CreateCoalitions < ActiveRecord::Migration
  def change
    create_table :coalitions do |t|
      t.string :name
      t.string :abbrev

      t.timestamps null: false
    end
  end
end
