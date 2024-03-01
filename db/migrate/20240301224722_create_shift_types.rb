class CreateShiftTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :shift_types do |t|
      t.string :name

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
