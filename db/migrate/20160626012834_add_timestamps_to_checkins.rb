class AddTimestampsToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :notified_at, :datetime
    add_column :checkins, :responded_at, :datetime
  end
end
