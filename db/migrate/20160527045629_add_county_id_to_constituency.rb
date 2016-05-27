class AddCountyIdToConstituency < ActiveRecord::Migration
  def change
    add_column :constituencies, :county_id, :integer
  end
end
