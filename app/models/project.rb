class Project < ActiveRecord::Base
  belongs_to :user

  has_many :project_causes
  has_many :causes, through: :project_causes

  has_many :checkins

  has_many :project_checkin_days, class_name: "::ProjectCheckinDay"
  has_many :checkin_days, through: :project_checkin_days, class_name: "::CheckinDay"

  def send_notification
    puts "Implement me"
  end
end
