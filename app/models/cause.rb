class Cause < ActiveRecord::Base
  validates :name, presence: true

  has_many :project_causes
  has_many :projects, through: :project_causes
end