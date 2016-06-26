class RenameCheckinCheckInDate < ActiveRecord::Migration
  def change
    remove_column :checkins, :check_in_date
  end
end
