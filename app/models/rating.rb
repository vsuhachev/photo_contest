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

  delegate :to_s, to: :criterion

  def contest
    juror_contest || photo_contest || criterion_contest
  end
end
