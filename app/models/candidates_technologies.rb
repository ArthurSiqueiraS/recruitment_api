class CandidatesTechnologies < ApplicationRecord
  belongs_to :candidate
  belongs_to :technology
end
