class CreateOauths < ActiveRecord::Migration[5.1]
  def change
    create_table :oauths do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
