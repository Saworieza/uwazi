class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :full_name
      t.date :born
      t.string :telephone

      t.timestamps null: false
    end
  end
end
