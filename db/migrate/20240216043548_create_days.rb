class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |t|
      t.string :calendar_day
      t.boolean :has_shifts
      t.date :start_time
      t.date :end_time

      # belongs_to either a weekly_availability or a weekly_schedule
      t.references :weekly_availability, null:false, foreign_key:true
      t.references :weekly_schedule, null:false, foreign_key:true

      t.timestamps
    end
  end
end
