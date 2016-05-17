class AddCoalitionIdToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :coalition_id, :integer
  end
end
