class AddAttachmentMainPhotoToServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.attachment :main_photo
    end
  end

  def self.down
    remove_attachment :services, :main_photo
  end
end
