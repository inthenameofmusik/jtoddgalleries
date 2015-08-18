class Employee < ActiveRecord::Base
	has_attached_file :staff_photo,
					:styles => {:thumb => "90x90#", :proper_height => "x300"},
					:storage => :s3
  	validates_attachment :staff_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
