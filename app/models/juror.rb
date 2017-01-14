class Juror < ApplicationRecord
  belongs_to :user
  belongs_to :contest

  validates :fio1, :fio2, presence: true
  validates :user, uniqueness: { scope: [:contest] }

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio
end
