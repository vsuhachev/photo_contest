class CreateContestPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :contest_photos do |t|
      t.references :photo, foreign_key: true
      t.references :contest, foreign_key: true
      t.references :nomination, foreign_key: true

      t.timestamps
    end
  end
end
