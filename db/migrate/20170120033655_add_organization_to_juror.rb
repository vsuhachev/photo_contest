class AddOrganizationToJuror < ActiveRecord::Migration[5.0]
  def change
    add_column :jurors, :organization, :string
  end
end
