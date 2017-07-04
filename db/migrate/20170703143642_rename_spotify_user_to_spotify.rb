class RenameSpotifyUserToSpotify < ActiveRecord::Migration[5.1]
  def change
    rename_table :spotify_users , :spotifys
  end
end
