class AddCountyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :county_id, :integer
  end
end
