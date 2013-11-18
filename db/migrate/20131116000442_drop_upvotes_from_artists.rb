class DropUpvotesFromArtists < ActiveRecord::Migration
  def change
  	remove_column :artists, :upvotes
  end
end
