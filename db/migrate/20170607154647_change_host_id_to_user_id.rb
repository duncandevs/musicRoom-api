class ChangeHostIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :rooms, :host_id, :user_id 
  end
end
