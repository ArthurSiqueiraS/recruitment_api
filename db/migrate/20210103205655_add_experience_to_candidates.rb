class AddExperienceToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :exp_min, :integer
    add_column :candidates, :exp_max, :integer
  end
end
