class CreateArtworksLocations < ActiveRecord::Migration
  def change
    create_join_table :artworks, :locations do |t|
    	t.index :artwork_id
    	t.index :location_id
    end
  end
end
