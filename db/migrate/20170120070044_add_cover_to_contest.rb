class AddCoverToContest < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :cover_data, :text
  end
end
