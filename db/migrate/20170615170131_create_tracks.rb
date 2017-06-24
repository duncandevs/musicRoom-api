class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :image_url
      t.string :uri
      t.string :status

      t.timestamps
    end
  end
end
