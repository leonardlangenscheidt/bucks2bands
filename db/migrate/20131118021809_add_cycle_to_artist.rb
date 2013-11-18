class AddCycleToArtist < ActiveRecord::Migration
  def change
  	add_column :artists, :cycle, :integer
  end
end
