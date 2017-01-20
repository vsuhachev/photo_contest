class AddAvatars < ActiveRecord::Migration[5.0]
  def change
    add_column :jurors, :avatar_data, :text
    add_column :competitors, :avatar_data, :text
  end
end
