class Contest < ApplicationRecord
  has_many :nominations
  has_many :criteria
end
