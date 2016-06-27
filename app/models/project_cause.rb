class ProjectCause < ActiveRecord::Base
  validates :project_id, :cause_id, presence: true
  validates :payment_percentage, presence: true, numericality: { greater_than: 0.0, less_than_or_equal_to: 1.00 }

  belongs_to :project
  belongs_to :cause
end