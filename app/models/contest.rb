class Contest < ApplicationRecord
  include Stateful

  has_many :nominations, dependent: :destroy
  has_many :criteria, dependent: :destroy
  has_many :jurors, dependent: :destroy
  has_many :competitors, dependent: :restrict_with_error
  has_many :photos, dependent: :restrict_with_error

  self.state_machine = ContestMachine

  scope :published, -> { where.not(state: :draft)  }

  validates :title, presence: true

  def to_s
    title
  end
end
