class Artwork < ActiveRecord::Base
	#validations
	validates :title, presence: true
	validates :jtg, presence: true, uniqueness: true


	#associations
	has_and_belongs_to_many :subjects

	#accepts attributes
	accepts_nested_attributes_for :subjects
end
