class AddAttachmentAltPhoto1ToExhibitions < ActiveRecord::Migration
  def self.up
    change_table :exhibitions do |t|
      t.attachment :alt_photo_1
    end
  end

  def self.down
    remove_attachment :exhibitions, :alt_photo_1
  end
end
