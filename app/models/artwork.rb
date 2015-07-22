class Artwork < ActiveRecord::Base
	#validations
	validates :title, presence: true
	validates :jtg, presence: true, uniqueness: true


	#associations
	has_and_belongs_to_many :subjects
	has_and_belongs_to_many :locations
	has_and_belongs_to_many :keywords
	belongs_to :artist
	has_and_belongs_to_many :styles
	has_and_belongs_to_many :media

	#accepts attributes
	accepts_nested_attributes_for :subjects
	accepts_nested_attributes_for :locations
	accepts_nested_attributes_for :keywords
	accepts_nested_attributes_for :artist
	accepts_nested_attributes_for :styles
	accepts_nested_attributes_for :media

	#paperclip
	has_attached_file :photo, :styles => {
		listing: ['200x165#', :jpg, quality: 80],
		detail: ['460x350>', :jpg, quality: 80],
		thumb: ['60>', :jpg, quality: 70],
		small: ['300>', :jpg, quality: 70],
		large: ['600>', :jpg, quality: 70]
	}
	validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
