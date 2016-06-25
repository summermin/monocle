class ProjectCause < ActiveRecord::Base
  validates :project_id, :cause_id, presence: true
end