class AddUserIdToCoalitions < ActiveRecord::Migration
  def change
    add_column :coalitions, :user_id, :integer
  end
end
