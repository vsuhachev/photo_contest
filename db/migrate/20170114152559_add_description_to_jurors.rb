class AddDescriptionToJurors < ActiveRecord::Migration[5.0]
  def change
    add_column :jurors, :description, :text
  end
end
