class CreateChatmsgs < ActiveRecord::Migration[5.1]
  def change
    create_table :chatmsgs do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
