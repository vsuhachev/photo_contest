class TweakLocationTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :jurors, :location, :string
    change_column :photos, :location, :string
  end
end
