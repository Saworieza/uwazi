class AddCoalitionIdToMps < ActiveRecord::Migration
  def change
    add_column :mps, :coalition_id, :integer
  end
end
