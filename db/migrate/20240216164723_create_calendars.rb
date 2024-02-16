class CreateCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :calendars do |t|
      t.date :start_date

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
