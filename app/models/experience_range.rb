class ExperienceRange < ApplicationRecord
  has_and_belongs_to_many :candidates
  has_and_belongs_to_many :jobs

  validates :min_years, presence: true, numericality: { greater_than: -1 }
  validate :max_years_greater

  private

  def max_years_greater
    unless max_years.nil? || min_years.nil?
      errors.add :max_years, "Field max_years must be greater than min_years" unless max_years > min_years
    end
  end
end
