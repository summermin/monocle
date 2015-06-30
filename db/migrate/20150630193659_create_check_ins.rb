class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.date :check_in_date
      t.string :status
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
