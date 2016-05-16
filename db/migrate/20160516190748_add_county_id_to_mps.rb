class AddCountyIdToMps < ActiveRecord::Migration
  def change
    add_column :mps, :county_id, :integer
  end
end
