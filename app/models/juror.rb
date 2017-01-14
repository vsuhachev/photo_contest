class Juror < ApplicationRecord
  belongs_to :user
  belongs_to :contest

  validates :user, :contest, :fio1, :fio2, presence: true

  def to_s
    [fio1, fio2, fio3].compact.join(' ')
  end
end
