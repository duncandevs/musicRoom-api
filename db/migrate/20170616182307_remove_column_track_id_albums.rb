class RemoveColumnTrackIdAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :track_id
  end
end
