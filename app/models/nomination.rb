class Nomination < ApplicationRecord
  belongs_to :contest
  has_many :photos, dependent: :restrict_with_error

  validates :title, presence: true

  def to_s
    title
  end
end
