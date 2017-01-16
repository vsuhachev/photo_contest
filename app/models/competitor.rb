class Competitor < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :photos, dependent: :restrict_with_error

  validates :fio1, :fio2, :dob, presence: true

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio
end
