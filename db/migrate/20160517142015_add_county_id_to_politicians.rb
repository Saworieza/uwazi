class AddCountyIdToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :county_id, :integer
  end
end
