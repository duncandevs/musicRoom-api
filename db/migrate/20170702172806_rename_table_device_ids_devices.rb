class RenameTableDeviceIdsDevices < ActiveRecord::Migration[5.1]
  def change
    rename_table :deviceIds, :devices
  end
end
