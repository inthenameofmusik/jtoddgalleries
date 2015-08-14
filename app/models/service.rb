class Service < ActiveRecord::Base
	has_attached_file :main_photo,
					:styles => {:detail => "500x300!"},
					:storage => :s3
  	validates_attachment :main_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
