class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :juror, foreign_key: true, index: false
      t.references :photo, foreign_key: true, index: false
      t.references :criterion, foreign_key: true, index: false
      t.integer :value

      t.index [:photo_id, :juror_id, :criterion_id], unique: true, name: 'index_ratings_on_photo_juror_criterion'

      t.timestamps
    end


  end
end
