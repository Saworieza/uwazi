class CreateMps < ActiveRecord::Migration
  def change
    create_table :mps do |t|
      t.string :full_name
      t.date :born
      t.string :telephone
      t.text :description
      t.string :web

      t.timestamps null: false
    end
  end
end
