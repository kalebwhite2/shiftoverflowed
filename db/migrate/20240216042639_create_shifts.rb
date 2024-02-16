class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.references :day, null:false, foreigh_key:true
      t.date :start_time
      t.string :shift_type

      t.timestamps
    end
  end
end
