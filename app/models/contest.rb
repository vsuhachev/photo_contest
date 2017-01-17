class Contest < ApplicationRecord
  include Stateful

  has_many :nominations, dependent: :destroy
  has_many :criteria, dependent: :destroy
  has_many :jurors, dependent: :destroy
  has_many :competitors, dependent: :restrict_with_error
  has_many :photos, dependent: :restrict_with_error

  self.state_machine = ContestMachine

  scope :published, -> { where.not(state: :draft)  }
  scope :active, -> { where(state: [:in_progress, :finished])  }

  validates :title, presence: true

  def to_s
    title
  end

  def photo
    photos.first
  end

  def user_is_juror?(user)
    jurors.exists?(user_id: user)
  end

  def juror_for_user(user)
    jurors.find_by(user_id: user)
  end
end
