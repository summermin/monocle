class CleanupProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :description
    remove_column :projects, :has_check_ins
    remove_column :projects, :name

    add_column :projects, :checkin_hour, :integer
    add_index :projects, :checkin_hour

    create_table :checkin_days do |t|
      t.string :name
      t.timestamps
    end

    add_index :checkin_days, :name, unique: true

    create_table :project_checkin_days do |t|
      t.integer :project_id
      t.integer :checkin_day_id
    end

    add_index :project_checkin_days, [:project_id, :checkin_day_id], unique: true
  end
end
