class AddColumnSpotifyIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profileId, :string
  end
end
