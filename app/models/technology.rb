class Technology < ApplicationRecord
  has_and_belongs_to_many :candidates
  has_and_belongs_to_many :jobs
end