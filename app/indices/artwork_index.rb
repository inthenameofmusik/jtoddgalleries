ThinkingSphinx::Index.define :artwork, :with => :active_record do
	indexes title, :sortable => true
	indexes jtg, :sortable => true
	has width
	has height
	has subjects.id, :as => :subject_ids
	indexes subjects.title, :as => :subject
	has locations.id, :as => :location_ids
	indexes locations.title, :as => :location
	has keywords.id, :as => :keyword_ids
	indexes keywords.title, :as => :keyword
	has artist.id, :as => :artist_id
	indexes artist.last_name, :as => :artist_last
	indexes artist.first_name, :as => :artist_first

	# has style.id, :as => :style_ids
	# has medium.id, :as => :medium_ids
end