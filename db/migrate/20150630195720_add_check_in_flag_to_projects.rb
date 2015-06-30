class AddCheckInFlagToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :has_check_ins, :boolean
  end
end
