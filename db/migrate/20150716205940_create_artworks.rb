class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :width
      t.integer :height
      t.string :jtg

      t.timestamps null: false
    end
  end
end
