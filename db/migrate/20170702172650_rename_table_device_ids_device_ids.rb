class RenameTableDeviceIdsDeviceIds < ActiveRecord::Migration[5.1]
  def change
    rename_table :device_ids, :deviceIds
  end
end
