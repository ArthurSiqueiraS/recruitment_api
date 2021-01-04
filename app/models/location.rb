class Location < ApplicationRecord
  has_many :candidates
  has_many :jobs, dependent: :nullify

  validates :city, presence: true
  validates :state, presence: true
end
