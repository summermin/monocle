class ProjectCause < ActiveRecord::Base
  validates :project_id, :cause_id, presence: true

  belongs_to :project
  belongs_to :cause
end