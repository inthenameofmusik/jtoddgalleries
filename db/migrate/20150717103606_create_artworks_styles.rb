class CreateArtworksStyles < ActiveRecord::Migration
  def change
    create_join_table :artworks, :styles do |t|
    	t.index :artwork_id
    	t.index :style_id
    end
  end
end
