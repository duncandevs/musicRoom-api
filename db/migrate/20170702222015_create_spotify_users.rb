class CreateSpotifyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :spotify_users do |t|
      t.integer :user_id
      t.string :spotifyUserId

      t.timestamps
    end
  end
end
