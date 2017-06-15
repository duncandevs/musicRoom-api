class AddEmbedUriToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :embed_uri, :string
  end
end
