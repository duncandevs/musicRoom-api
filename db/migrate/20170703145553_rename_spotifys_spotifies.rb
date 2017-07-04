class RenameSpotifysSpotifies < ActiveRecord::Migration[5.1]
  def change
    rename_table :spotifys , :spotifies
  end
end
