class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :location
      t.date :obtained_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
