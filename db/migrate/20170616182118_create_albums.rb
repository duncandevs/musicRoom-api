class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :uri
      t.string :image
      t.string :track_id

      t.timestamps
    end
  end
end
