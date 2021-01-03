class CreateCandidatesTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates_technologies do |t|
      t.boolean :main, default: false
      t.references :candidate, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
