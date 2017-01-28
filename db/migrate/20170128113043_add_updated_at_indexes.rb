class AddUpdatedAtIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :competitors, :updated_at
    add_index :contests, :updated_at
    add_index :criteria, :updated_at
    add_index :jurors, :updated_at
    add_index :nominations, :updated_at
    add_index :photos, :updated_at
    add_index :ratings, :updated_at
    add_index :users, :updated_at
  end
end
