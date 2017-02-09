class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :event_name
      t.datetime :event_date
      t.string :event_location
      t.timestamps null: false
    end
  end
end
