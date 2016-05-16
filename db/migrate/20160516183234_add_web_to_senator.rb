class AddWebToSenator < ActiveRecord::Migration
  def change
    add_column :senators, :web, :string
  end
end
