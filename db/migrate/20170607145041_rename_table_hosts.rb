class RenameTableHosts < ActiveRecord::Migration[5.1]
  def change
    rename_table :hosts, :users
  end
end
