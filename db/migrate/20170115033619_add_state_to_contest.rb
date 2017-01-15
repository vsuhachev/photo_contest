class AddStateToContest < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :state, :string
  end
end
