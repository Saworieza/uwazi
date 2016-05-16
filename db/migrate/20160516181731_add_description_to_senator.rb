class AddDescriptionToSenator < ActiveRecord::Migration
  def change
    add_column :senators, :description, :text
  end
end
