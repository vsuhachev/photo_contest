class Nomination < ApplicationRecord
  belongs_to :contest
  has_many :photos

  validates :title, presence: true

  def to_s
    title
  end
end
