class CreateGallerySnippets < ActiveRecord::Migration
  def change
    create_table :gallery_snippets do |t|
      t.string :name
      t.text :value

      t.timestamps null: false
    end
  end
end
