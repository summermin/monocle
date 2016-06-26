class Checkin < ActiveRecord::Base
  validates :status, presence: true

  belongs_to :project

  scope :notified, -> { where(status: "notified") }
  scope :completed, -> { where(status: "completed") }
  scope :failed, -> { where(status: "failed") }

  def fail!
    update_attributes!(status: "failed")
  end

  def complete!
    update_attributes!(status: "completed")
  end
end
