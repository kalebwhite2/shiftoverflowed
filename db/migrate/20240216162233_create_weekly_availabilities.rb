class CreateWeeklyAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_availabilities do |t|
      t.date :start_date

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
