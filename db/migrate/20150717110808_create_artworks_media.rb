class CreateArtworksMedia < ActiveRecord::Migration
  def change
    create_join_table :artworks, :media do |t|
    	t.index :artwork_id
    	t.index :medium_id
    end
  end
end
