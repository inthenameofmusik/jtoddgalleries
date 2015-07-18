class CreateArtworksKeywords < ActiveRecord::Migration
  def change
    create_join_table :artworks, :keywords do |t|
    	t.index :artwork_id
    	t.index :keyword_id
    end
  end
end
