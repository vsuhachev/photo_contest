class Criterion < ApplicationRecord
  belongs_to :contest

  has_many :ratings, dependent: :delete_all

  validates :title, presence: true

  def to_s
    title
  end
end
