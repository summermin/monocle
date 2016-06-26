class NotificationCheckin < ActiveRecord::Base
  validates :notification_id, :checkin_id, :identifier, presence: true

  belongs_to :notification
  belongs_to :checkin

  before_validation :generate_identifier, on: :create

  private

  def generate_identifier
    # Currently not used. Going to get things working with just one goal per user first
    # Read on for more details why this is hard
    #
    # We need to generate a positive and negative identifier for every checkin
    # Given that a user can have many goals, we aren't able to track which checkin
    # they are responding yes/no to based on just boolean values.
    #
    # Current brainstorm is splitting by goal types, and adding a unique integer
    # based on positive/negative value, and incrementing by number of goals of that type per user
    #
    # Example: User has three running goals, and two meditation goals
    # Respond R01/R00 for pass/fail
    # Respond R11/R20 for pass/fail
    # Respond R21/R30 for pass/fail
    # Respond M01/M00 for pass/fail
    # Respond M11/M10 for pass/fail
    self.identifier = "Z#{rand(10**3).to_s.rjust(3,'0')}"
  end
end