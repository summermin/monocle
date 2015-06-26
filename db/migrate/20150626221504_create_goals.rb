class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :goals, :users
  end
end
