class Nomination < ApplicationRecord
  belongs_to :contest

  def to_s
    title
  end
end
