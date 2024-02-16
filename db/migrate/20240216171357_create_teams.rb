class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :invite_code
      t.string :admin_invite_code

      t.timestamps
    end
  end
end
