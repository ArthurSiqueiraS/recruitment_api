class RemoveExperienceRangeFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_reference :jobs, :experience_range, null: false, foreign_key: true
  end
end
