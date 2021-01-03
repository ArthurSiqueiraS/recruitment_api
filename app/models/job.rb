class Job < ApplicationRecord
  belongs_to :experience_range
  belongs_to :location
  has_and_belongs_to_many :technologies
end
