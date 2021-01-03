class CreateJobsTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs_technologies do |t|
      t.references :job, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
