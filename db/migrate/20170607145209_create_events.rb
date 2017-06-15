class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :host_id
      t.string :name

      t.timestamps
    end
  end
end
