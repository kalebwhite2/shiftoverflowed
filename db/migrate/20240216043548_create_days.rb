class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |t|
      t.string :calendar_day
      t.boolean :has_shifts
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
