class CreateExperienceRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :experience_ranges do |t|
      t.integer :min_years
      t.integer :max_years

      t.timestamps
    end
  end
end
