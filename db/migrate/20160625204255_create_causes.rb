class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    add_index :causes, :name, unique: true

    create_table :project_causes do |t|
      t.integer :project_id
      t.integer :cause_id
      t.timestamps
    end

    add_index :project_causes, [:project_id, :cause_id], unique: true
  end
end
