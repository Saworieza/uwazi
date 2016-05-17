class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.text :full_name
      t.date :born
      t.string :telephone
      t.string :web
      t.text :description
      t.string :email

      t.timestamps null: false
    end
  end
end
