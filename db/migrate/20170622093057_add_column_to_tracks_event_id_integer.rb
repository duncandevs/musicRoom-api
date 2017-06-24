class AddColumnToTracksEventIdInteger < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :event_id , :integer
  end
end
