class CreateJurors < ActiveRecord::Migration[5.0]
  def change
    create_table :jurors do |t|
      t.string :fio1
      t.string :fio2
      t.string :fio3
      t.date :dob
      t.text :location
      t.references :user, foreign_key: true
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
