class Contest < ApplicationRecord
  include Stateful

  has_many :nominations
  has_many :criteria
  has_many :jurors
  has_many :competitors
  has_many :photos, through: :nominations

  self.state_machine = ContestMachine

  scope :published, -> { where.not(state: :draft)  }

  validates :title, presence: true

  def to_s
    title
  end
end
