class Project < ActiveRecord::Base
  validates :user_id, :project_type, presence: true

  belongs_to :user

  has_many :project_causes
  has_many :causes, through: :project_causes

  has_many :checkins
  has_many :notification_checkins, through: :checkins

  has_many :email_notification_methods
  has_many :sms_notification_methods

  has_many :project_checkin_days, class_name: "::ProjectCheckinDay"
  has_many :checkin_days, through: :project_checkin_days, class_name: "::CheckinDay"

  scope :active, -> { where("start_date <= ? AND end_date >= ?", Date.today, Date.today) }

  def notification_methods
    (email_notification_methods + sms_notification_methods)
  end

  def send_notifications(checkin)
    notification_methods.each {|notification| notification.notify(checkin) }
  end

  def create_checkin
    checkins.where(status: "notified", responded_at: nil).map(&:fail!)
    checkins.create!(status: "notified", notified_at: Time.now)
  end

  def self.for_day_and_hour(day_of_week, hour)
    joins(project_checkin_days: :checkin_day).
      where(checkin_days: { name: day_of_week }, checkin_hour: hour)
  end
end
