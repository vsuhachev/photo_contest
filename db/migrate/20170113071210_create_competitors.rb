class CreateCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors do |t|
      t.string :fio1
      t.string :fio2
      t.string :fio3
      t.date :dob
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
