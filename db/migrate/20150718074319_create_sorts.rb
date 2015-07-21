class CreateSorts < ActiveRecord::Migration
  def change
    create_table :sorts do |t|
      t.string :title
      t.string :value

      t.timestamps null: false
    end
  end
end
