# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_16_171357) do
  create_table "calendars", force: :cascade do |t|
    t.date "start_date"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_calendars_on_team_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "calendar_day"
    t.boolean "has_shifts"
    t.date "start_time"
    t.date "end_time"
    t.integer "weekly_availability_id", null: false
    t.integer "weekly_schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weekly_availability_id"], name: "index_days_on_weekly_availability_id"
    t.index ["weekly_schedule_id"], name: "index_days_on_weekly_schedule_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "day_id", null: false
    t.date "start_time"
    t.string "shift_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_shifts_on_day_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "invite_code"
    t.string "admin_invite_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_availabilities", force: :cascade do |t|
    t.date "start_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weekly_availabilities_on_user_id"
  end

  create_table "weekly_schedules", force: :cascade do |t|
    t.date "start_date"
    t.integer "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_weekly_schedules_on_calendar_id"
  end

  add_foreign_key "calendars", "teams"
  add_foreign_key "days", "weekly_availabilities"
  add_foreign_key "days", "weekly_schedules"
  add_foreign_key "shifts", "days"
  add_foreign_key "weekly_availabilities", "users"
  add_foreign_key "weekly_schedules", "calendars"
end
