class RenamePoliticansTableToSenators < ActiveRecord::Migration
  def change
    rename_table :politicians, :senators
  end
end
