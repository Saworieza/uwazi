class AddAttachmentAvatarToSenators < ActiveRecord::Migration
  def self.up
    change_table :senators do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :senators, :avatar
  end
end
