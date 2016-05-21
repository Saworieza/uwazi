class AddApprovedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :approved, :boolean#, default: 0
  end
end
