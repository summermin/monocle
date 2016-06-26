class AddIndicesToCheckins < ActiveRecord::Migration
  def change
    add_index :checkins, :status
    add_index :checkins, :responded_at
  end
end
