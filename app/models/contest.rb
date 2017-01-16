class Contest < ApplicationRecord
  include Stateful

  has_many :nominations
  has_many :criteria
  has_many :jurors
  has_many :compositions
  has_many :photos, through: :compositions

  self.state_machine = ContestMachine

  scope :published, -> { where.not(state: :draft)  }
  scope :active_competitors, -> { competitors }

  validates :title, presence: true

  def to_s
    title
  end
end
