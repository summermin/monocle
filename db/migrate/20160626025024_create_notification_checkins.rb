class CreateNotificationCheckins < ActiveRecord::Migration
  def change
    create_table :notification_checkins do |t|
      t.integer :notification_id
      t.integer :checkin_id
      t.string :identifier
      t.timestamps
    end

    add_index :notification_checkins, :notification_id
    add_index :notification_checkins, :checkin_id
  end
end
