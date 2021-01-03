class Location < ApplicationRecord
  has_many :candidates
  has_many :jobs

  validates :city, presence: true
end
