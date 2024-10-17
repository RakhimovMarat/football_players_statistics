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

ActiveRecord::Schema[7.1].define(version: 2024_10_17_085752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.date "match_date"
    t.float "match_importance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "saves"
    t.integer "clean_sheets"
    t.integer "goals"
    t.integer "assists"
    t.integer "shots"
    t.integer "shots_on_target"
    t.integer "tackles"
    t.integer "passes"
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.float "player_rating"
    t.integer "yellow_cards"
    t.index ["match_id"], name: "index_statistics_on_match_id"
    t.index ["player_id", "match_id", "role_id"], name: "index_statistics_on_player_id_and_match_id_and_role_id"
    t.index ["player_id"], name: "index_statistics_on_player_id"
    t.index ["role_id"], name: "index_statistics_on_role_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "players", "teams"
  add_foreign_key "statistics", "matches"
  add_foreign_key "statistics", "players"
  add_foreign_key "statistics", "roles"
end
