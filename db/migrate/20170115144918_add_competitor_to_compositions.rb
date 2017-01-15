class AddCompetitorToCompositions < ActiveRecord::Migration[5.0]
  def change
    add_reference :compositions, :competitor, foreign_key: true
  end
end
