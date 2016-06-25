class EmailNotification < ActiveRecord::Base
  validates :email, :project_id, presence: true

  def notify
    ProjectNotificationMailer.checkin_email(to_address: email).deliver_now
  end
end