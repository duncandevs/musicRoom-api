class RenameColumnPlaylists < ActiveRecord::Migration[5.1]
  def change
    rename_column :playlists , :user_id , :host_id
  end
end
