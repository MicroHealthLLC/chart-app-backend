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

ActiveRecord::Schema.define(version: 2021_08_23_204420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboard_reports", force: :cascade do |t|
    t.integer "dashboard_id"
    t.integer "report_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboard_tags", force: :cascade do |t|
    t.integer "dashboard_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "channel_id"
    t.string "layout"
    t.string "tags", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_sets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "report_tags", force: :cascade do |t|
    t.integer "report_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "chart_type"
    t.integer "channel_id"
    t.integer "data_set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
