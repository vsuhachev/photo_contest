class AddDescriptionToCompetitor < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :description, :text
  end
end
