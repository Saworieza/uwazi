class AddContestTypeToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :contest_type, :integer
  end
end
