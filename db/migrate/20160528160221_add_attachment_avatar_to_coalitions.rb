class AddAttachmentAvatarToCoalitions < ActiveRecord::Migration
  def self.up
    change_table :coalitions do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :coalitions, :avatar
  end
end
