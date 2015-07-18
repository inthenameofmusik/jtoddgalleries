class Subject < ActiveRecord::Base
	#validations only for managing Subjects in their own domain
		#not through Artwork Model
	validates :title, presence: true, uniqueness: true

	#associations
	has_and_belongs_to_many :artworks
end
