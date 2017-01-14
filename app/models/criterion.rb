class Criterion < ApplicationRecord
  belongs_to :contest

  def to_s
    title
  end
end
