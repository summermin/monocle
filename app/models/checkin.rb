class Checkin < ActiveRecord::Base
  validates :status, presence: true

  belongs_to :project

  def fail!
    update_attributes!(status: "failed")
  end
end
