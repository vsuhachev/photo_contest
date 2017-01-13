class ContestPhoto < ApplicationRecord
  belongs_to :photo
  belongs_to :contest
  belongs_to :nomination

  has_one :user, through: :photo

  scope :authored, -> (user) { joins(:photo).where(photos: { user: user }) }

  validate do
    errors.add('nomination must belongs to contest') if nomination && contest != nomination&.contest
  end
end
