class DirectLinkPhotoToContest < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :contest, foreign_key: true
  end
end
