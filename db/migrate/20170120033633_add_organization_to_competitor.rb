class AddOrganizationToCompetitor < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :organization, :string
  end
end
