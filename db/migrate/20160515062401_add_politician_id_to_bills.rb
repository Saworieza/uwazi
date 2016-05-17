class AddPoliticianIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :senator_id, :integer
  end
end
