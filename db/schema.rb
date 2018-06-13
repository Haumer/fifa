# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180613115049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "match_id"
    t.bigint "away_team_id"
    t.bigint "home_team_id"
    t.datetime "date"
    t.string "location"
    t.bigint "group_id"
    t.string "home_name"
    t.string "away_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
    t.string "date_string"
    t.string "round"
    t.integer "home_team_goals", default: 0
    t.integer "away_team_goals", default: 0
    t.integer "home_team_yellow_cards", default: 0
    t.integer "away_team_yellow_cards", default: 0
    t.integer "home_team_red_cards", default: 0
    t.integer "away_team_red_cards", default: 0
    t.integer "minutes_played", default: 0
    t.string "match_status", default: "Not played"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["group_id"], name: "index_matches_on_group_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "points", default: 0
    t.integer "integer", default: 0
    t.integer "wins", default: 0
    t.integer "draws", default: 0
    t.integer "losses", default: 0
    t.integer "goals_for", default: 0
    t.integer "goals_against", default: 0
    t.integer "yellow_card", default: 0
    t.integer "red_card", default: 0
    t.string "photo"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "groups"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "teams", "groups"
end
