class MoveNotifications < ActiveRecord::Migration
  def change
    rename_table :email_notifications, :email_notification_methods
    rename_table :sms_notifications, :sms_notification_methods
  end
end
