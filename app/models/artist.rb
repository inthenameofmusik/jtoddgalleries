class Artist < ActiveRecord::Base
	#validations for own domain, not through Artwork model
	validates :first_name, presence: true

	#associations
	has_many :artworks

	def fullname
		"#{self.first_name} #{self.last_name}"
	end
end
