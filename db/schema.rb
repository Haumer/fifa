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

ActiveRecord::Schema.define(version: 20180609201332) do

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
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["group_id"], name: "index_matches_on_group_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.integer "wins"
    t.integer "draws"
    t.integer "losses"
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "yellow_card"
    t.integer "red_card"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  add_foreign_key "matches", "groups"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "teams", "groups"
end
