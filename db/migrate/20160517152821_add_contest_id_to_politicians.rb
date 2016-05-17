class AddContestIdToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :contest_id, :integer
  end
end
