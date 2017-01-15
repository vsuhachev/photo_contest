class RenameContestPhotoToComposition < ActiveRecord::Migration[5.0]
  def change
    rename_table :contest_photos, :compositions
  end
end
