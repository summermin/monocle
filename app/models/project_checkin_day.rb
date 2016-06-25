class ProjectCheckinDay < ActiveRecord::Base
  validates :project_id, :checkin_day_id, presence: true

  belongs_to :checkin_day
  belongs_to :project
end