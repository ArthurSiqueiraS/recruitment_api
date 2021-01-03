# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_03_001017) do

  create_table "candidates", force: :cascade do |t|
    t.integer "experience_range_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_range_id"], name: "index_candidates_on_experience_range_id"
    t.index ["location_id"], name: "index_candidates_on_location_id"
  end

  create_table "candidates_technologies", force: :cascade do |t|
    t.boolean "main", default: false
    t.integer "candidate_id", null: false
    t.integer "technology_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidates_technologies_on_candidate_id"
    t.index ["technology_id"], name: "index_candidates_technologies_on_technology_id"
  end

  create_table "experience_ranges", force: :cascade do |t|
    t.integer "min_years"
    t.integer "max_years"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "experience_range_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_range_id"], name: "index_jobs_on_experience_range_id"
    t.index ["location_id"], name: "index_jobs_on_location_id"
  end

  create_table "jobs_technologies", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "technology_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_jobs_technologies_on_job_id"
    t.index ["technology_id"], name: "index_jobs_technologies_on_technology_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidates", "experience_ranges"
  add_foreign_key "candidates", "locations"
  add_foreign_key "candidates_technologies", "candidates"
  add_foreign_key "candidates_technologies", "technologies"
  add_foreign_key "jobs", "experience_ranges"
  add_foreign_key "jobs", "locations"
  add_foreign_key "jobs_technologies", "jobs"
  add_foreign_key "jobs_technologies", "technologies"
end
