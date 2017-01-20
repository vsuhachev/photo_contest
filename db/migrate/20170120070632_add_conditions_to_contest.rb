class AddConditionsToContest < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :conditions, :text
  end
end
