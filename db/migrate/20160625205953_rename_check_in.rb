class RenameCheckIn < ActiveRecord::Migration
  def change
    rename_table :check_ins, :checkins
  end
end
