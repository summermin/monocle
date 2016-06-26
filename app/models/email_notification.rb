class EmailNotification < ActiveRecord::Base
  validates :email, :project_id, presence: true

  belongs_to :project

  def notify(checkin)
    ProjectNotificationMailer.checkin_email(to_address: email, checkin: checkin).deliver_now
  end
end