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

ActiveRecord::Schema[7.0].define(version: 2024_09_09_092334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_treatments", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "treatment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_treatments_on_booking_id"
    t.index ["treatment_id"], name: "index_booking_treatments_on_treatment_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.date "date"
    t.time "time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "timeslot_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["timeslot_id"], name: "index_bookings_on_timeslot_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_treatments", "bookings"
  add_foreign_key "booking_treatments", "treatments"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "timeslots"
end
