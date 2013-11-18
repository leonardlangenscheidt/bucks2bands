class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :label
      t.string :genre
      t.text :bio
      t.integer :upvotes

      t.timestamps
    end
  end
end
