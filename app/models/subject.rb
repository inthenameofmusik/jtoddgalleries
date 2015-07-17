class Subject < ActiveRecord::Base
	#validations
	validates :title, presence: true, uniqueness: true

	#associations
	has_and_belongs_to_many :artworks
end
