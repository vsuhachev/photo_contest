class Rating < ApplicationRecord
  belongs_to :juror
  belongs_to :photo
  belongs_to :criterion

  has_one :user, through: :juror

  has_one :juror_contest, class_name: 'Contest', through: :juror, source: :contest
  has_one :photo_contest, class_name: 'Contest', through: :photo, source: :contest
  has_one :criterion_contest, class_name: 'Contest', through: :criterion, source: :contest

  validates :value, numericality: true, inclusion: { in: 1..10 }
  validates :criterion, uniqueness: { scope: [:photo, :juror] }
  validate do
    errors.add(:photo_contest, :contest_not_belongs_to_juror) if photo_contest && juror_contest && photo_contest != juror_contest
    errors.add(:criterion_contest, :contest_not_belongs_to_juror) if criterion_contest && juror_contest && criterion_contest != juror_contest
  end

  scope :owned_by, -> (user) { joins(:juror).where(jurors: { user_id: user }) }
  scope :for_photo, -> (photo) { where(photo_id: photo) }
  scope :for_criterion, -> (criterion) { where(criterion_id: criterion) }
  scope :for_juror, -> (juror) { where(juror_id: juror) }

  scope :averages_for_photo, -> (photo) { find_by_sql([<<~SQL, photo]) }
      SELECT
        ratings.id,
        photos.id photo_id, criteria.id criterion_id, avg(value) value
      FROM
        photos
          INNER JOIN criteria on criteria.contest_id = photos.contest_id
          LEFT OUTER JOIN ratings ON photo_id = photos.id AND criterion_id = criteria.id
          LEFT OUTER JOIN jurors ON juror_id = jurors.id
      WHERE
        (photos.user_id ISNULL OR jurors.user_id ISNULL OR photos.user_id != jurors.user_id)
        AND photos.id = ?
      GROUP BY photos.id, criteria.id
      ORDER BY photos.id, criteria.id
  SQL

  delegate :to_s, to: :criterion

  def contest
    juror_contest || photo_contest || criterion_contest
  end
end
