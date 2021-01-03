class Location < ApplicationRecord
  validates :city, presence: true

  has_many :candidates
  has_many :jobs
end
