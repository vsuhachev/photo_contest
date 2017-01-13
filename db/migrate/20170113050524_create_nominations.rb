class CreateNominations < ActiveRecord::Migration[5.0]
  def change
    create_table :nominations do |t|
      t.string :title
      t.text :description
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
