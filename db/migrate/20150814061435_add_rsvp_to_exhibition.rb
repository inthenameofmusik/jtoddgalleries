class AddRsvpToExhibition < ActiveRecord::Migration
  def change
    add_column :exhibitions, :link, :string
  end
end
