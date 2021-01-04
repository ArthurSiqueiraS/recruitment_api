class Job < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :technologies

  validates :exp_min, presence: true, numericality: { greater_than: -1 }
  validate :exp_max_greater

  private

  def exp_max_greater
    unless exp_max.nil? || exp_min.nil?
      errors.add :exp_max, "Field exp_max must be greater than exp_min" unless exp_max > exp_min
    end
  end
end
