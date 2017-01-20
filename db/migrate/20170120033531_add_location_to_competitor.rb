class AddLocationToCompetitor < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :location, :string
  end
end
