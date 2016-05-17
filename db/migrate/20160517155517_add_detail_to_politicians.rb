class AddDetailToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians,    :primary_secondary_school, :text
	  add_column :politicians,    :undergraduate_school, :text
	  add_column :politicians,    :graduate_school, :text
	  add_column :politicians,    :previous_position, :text
  end
end
