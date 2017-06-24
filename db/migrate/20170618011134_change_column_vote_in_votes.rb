class ChangeColumnVoteInVotes < ActiveRecord::Migration[5.1]
  def change
    change_column :votes , :vote, :boolean
  end
end
