class AddColumnCode < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms , :code , :integer
  end
end
