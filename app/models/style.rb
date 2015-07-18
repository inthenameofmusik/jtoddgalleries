class Style < ActiveRecord::Base
	#validations through own domain, not Artwork model
	validates :title, presence: true, uniqueness: true

	#associations
	has_and_belongs_to_many :artworks
end
