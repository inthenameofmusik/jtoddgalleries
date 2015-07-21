class Exhibition < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true
  validates :from_date, presence: true
  validates :admission, presence: true

  has_attached_file :main_photo, :styles => {
  	:listing => "960x150#",
  	:full_feature => "960x720>"
  }
  validates_attachment :main_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
