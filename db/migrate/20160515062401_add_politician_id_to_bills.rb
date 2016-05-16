class AddPoliticianIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :politician_id, :integer
  end
end
