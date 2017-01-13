class CreateCompetitorsContests < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors_contests do |t|
      t.references :competitor, foreign_key: true
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
