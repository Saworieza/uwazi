class AddCoalitionIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :coalition_id, :integer
  end
end
