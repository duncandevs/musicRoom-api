class RenameCodeToInviteCodeInEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events , :code, :invite_code
  end
end
