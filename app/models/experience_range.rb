class ExperienceRange < ApplicationRecord
  validates :min_years, presence: true

  has_and_belongs_to_many :candidates
  has_and_belongs_to_many :jobs
end
