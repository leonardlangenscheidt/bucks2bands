class AddTrackToArtist < ActiveRecord::Migration
  def change
  	add_column :artists, :track, :string
  end
end
