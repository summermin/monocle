class CreateProjectNotifications < ActiveRecord::Migration
  def change
    create_table :email_notifications do |t|
      t.integer :project_id
      t.string :email
      t.timestamps
    end

    add_index :email_notifications, :project_id

    create_table :sms_notifications do |t|
      t.integer :project_id
      t.string :phone_number
      t.timestamps
    end

    add_index :sms_notifications, :project_id
  end
end
