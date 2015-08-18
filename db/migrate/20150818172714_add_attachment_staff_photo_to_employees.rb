class AddAttachmentStaffPhotoToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.attachment :staff_photo
    end
  end

  def self.down
    remove_attachment :employees, :staff_photo
  end
end
