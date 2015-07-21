class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.text :description
      t.references :artist, index: true, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.string :admission

      t.timestamps null: false
    end
  end
end
