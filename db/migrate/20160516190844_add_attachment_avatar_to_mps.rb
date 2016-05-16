class AddAttachmentAvatarToMps < ActiveRecord::Migration
  def self.up
    change_table :mps do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :mps, :avatar
  end
end
