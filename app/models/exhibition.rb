class Exhibition < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true
  validates :from_date, presence: true
  validates :admission, presence: true

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

  validates_attachment :main_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
