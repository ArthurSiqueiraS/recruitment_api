class AddBaseIdToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :base_id, :integer
  end
end
