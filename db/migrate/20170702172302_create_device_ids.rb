class CreateDeviceIds < ActiveRecord::Migration[5.1]
  def change
    create_table :device_ids do |t|
      t.string :deviceId
      t.integer :user_id
      t.timestamps
    end
  end
end
