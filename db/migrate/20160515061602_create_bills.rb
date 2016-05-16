class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.text :summary
      t.date :date

      t.timestamps null: false
    end
  end
end
