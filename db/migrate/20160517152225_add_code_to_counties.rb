class AddCodeToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :code, :string
  end
end
