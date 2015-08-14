class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.string :value

      t.timestamps null: false
    end
  end
end
