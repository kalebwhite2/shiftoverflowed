class CreateWeeklySchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_schedules do |t|
      t.date :start_date

      t.references :calendar, foreign_key: true

      t.timestamps
    end
  end
end
