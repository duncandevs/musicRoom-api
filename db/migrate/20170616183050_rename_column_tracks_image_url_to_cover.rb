class RenameColumnTracksImageUrlToCover < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks , :image_url, :cover
  end
end
