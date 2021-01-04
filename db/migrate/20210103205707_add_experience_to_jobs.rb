class AddExperienceToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :exp_min, :integer
    add_column :jobs, :exp_max, :integer
  end
end
