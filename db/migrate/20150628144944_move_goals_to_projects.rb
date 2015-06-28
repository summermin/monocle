class MoveGoalsToProjects < ActiveRecord::Migration
  def change
    rename_table :goals, :projects
  end
end
