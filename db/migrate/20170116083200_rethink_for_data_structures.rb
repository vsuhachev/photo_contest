class RethinkForDataStructures < ActiveRecord::Migration[5.0]
  def change
    add_reference :competitors, :contest, foreign_key: true
    add_reference :photos, :nomination, foreign_key: true
    add_reference :photos, :competitor, foreign_key: true
    drop_table :compositions
  end
end
