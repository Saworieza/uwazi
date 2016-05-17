class AddAttachmentDocumentToBills < ActiveRecord::Migration
  def self.up
    change_table :bills do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :bills, :document
  end
end
