class AddBaseIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :base_id, :integer
  end
end
