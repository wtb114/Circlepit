class RemoveGroupIdFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :group_id, :string
  end
end
