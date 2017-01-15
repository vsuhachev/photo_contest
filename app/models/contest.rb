class Contest < ApplicationRecord
  include Stateful

  has_many :nominations
  has_many :criteria

  has_many :competitors_contests
  has_many :competitors, through: :competitors_contests

  has_many :compositions
  has_many :photos, through: :compositions
  has_many :jurors

  self.state_machine = ContestMachine

  scope :active_competitors, -> { competitors }

  validates :title, presence: true

  def to_s
    title
  end
end
