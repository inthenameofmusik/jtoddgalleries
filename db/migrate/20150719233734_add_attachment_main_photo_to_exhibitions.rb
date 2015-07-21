class AddAttachmentMainPhotoToExhibitions < ActiveRecord::Migration
  def self.up
    change_table :exhibitions do |t|
      t.attachment :main_photo
    end
  end

  def self.down
    remove_attachment :exhibitions, :main_photo
  end
end
