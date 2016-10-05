class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.string :group_name
      t.text :group_comment
      t.attachment :group_top_image
      t.timestamps null: false
    end
  end
end
