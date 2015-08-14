class Exhibition < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true
  validates :from_date, presence: true

  has_attached_file :main_photo,
					:styles => {
					  	:listing => "960x150#",
					  	:full_feature => "960x720>"
					},
					:storage => :s3
					# :s3_credentials => "#{Rails.root}/config/application.yml",
					# :url => ":s3_domain_url",
					# :path => ":class/:id.:style.:extension",
					# :s3_host_name => "s3-eu-west-1.amazonaws.com",
					# :bucket => "media.jtodd.com"
	has_attached_file :alt_photo_1,
					:styles => {:popup => "800>", :icon => "90x90!"},
					:storage => :s3
	has_attached_file :alt_photo_2,
					:styles => {:popup => "800>", :icon => "90x90!"},
					:storage => :s3
	has_attached_file :alt_photo_3,
					:styles => {:popup => "800>", :icon => "90x90!"},
					:storage => :s3


  	validates_attachment :main_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
