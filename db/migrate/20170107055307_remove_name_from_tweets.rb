class RemoveNameFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :name, :text
  end
end
