class Nomination < ApplicationRecord
  belongs_to :contest

  validates :title, presence: true

  def to_s
    title
  end
end
