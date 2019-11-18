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

ActiveRecord::Schema.define(version: 20191116145923) do

  create_table "alert_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.string "to_dest"
    t.string "at_domain"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "fk_rails_c6759dfb11"
  end

  create_table "bcadvancements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "from_contest_id"
    t.string "wl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "sport"
    t.integer "variety"
    t.boolean "poolgroupseason"
    t.string "poolgroupseasonlabel"
    t.boolean "playoffbracket"
    t.string "playoffbracketlabel"
    t.boolean "keepscores"
    t.integer "winpoints"
    t.integer "drawpoints"
    t.integer "losspoints"
    t.integer "forfeitpoints"
    t.integer "forfeitwinscore"
    t.integer "forfeitlossscore"
    t.bigint "organization_id"
    t.string "hashed_manager_password"
    t.string "hashed_scorer_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "fk_rails_6f3abb5cef"
  end

  create_table "contestants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competition_id"
    t.string "type"
    t.bigint "contest_id"
    t.string "contest_type"
    t.string "homeaway"
    t.bigint "team_id"
    t.integer "score"
    t.boolean "forfeit"
    t.integer "seeding"
    t.bigint "bracketgrouping_id"
    t.string "bcspec_type"
    t.bigint "bcspec_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "fk_rails_c669339d8d"
    t.index ["team_id"], name: "fk_rails_76e287fe1e"
  end

  create_table "contests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competition_id"
    t.string "type"
    t.date "date"
    t.integer "time"
    t.bigint "venue_id"
    t.string "status"
    t.bigint "homecontestant_id"
    t.bigint "awaycontestant_id"
    t.bigint "bracketgrouping_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["awaycontestant_id"], name: "fk_rails_dba3c74f7b"
    t.index ["bracketgrouping_id"], name: "fk_rails_61d7e55deb"
    t.index ["competition_id"], name: "fk_rails_a259843d99"
    t.index ["homecontestant_id"], name: "fk_rails_320d743178"
    t.index ["venue_id"], name: "fk_rails_9def925428"
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "origin"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_customers_on_unlock_token", unique: true
  end

  create_table "groupingplaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "grouping_id"
    t.integer "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competition_id"
    t.string "name"
    t.bigint "parent_id"
    t.boolean "bracket_grouping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "fk_rails_bced43dcbc"
    t.index ["parent_id"], name: "fk_rails_bfce7bee4d"
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone"
    t.string "website"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "grouping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grouping_id"], name: "fk_rails_e2fb33caf7"
  end

  create_table "valid_dates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "gamedate"
    t.bigint "competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id", "gamedate"], name: "index_valid_dates_on_competition_id_and_gamedate", unique: true
  end

  create_table "valid_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competition_id"
    t.integer "from_time"
    t.integer "to_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_valid_times_on_competition_id"
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "fk_rails_dc21084db7"
  end

  add_foreign_key "alert_requests", "teams"
  add_foreign_key "competitions", "organizations"
  add_foreign_key "contestants", "contests"
  add_foreign_key "contestants", "teams"
  add_foreign_key "contests", "competitions"
  add_foreign_key "contests", "contestants", column: "awaycontestant_id"
  add_foreign_key "contests", "contestants", column: "homecontestant_id"
  add_foreign_key "contests", "groupings", column: "bracketgrouping_id"
  add_foreign_key "contests", "venues"
  add_foreign_key "groupings", "competitions"
  add_foreign_key "groupings", "groupings", column: "parent_id"
  add_foreign_key "teams", "groupings"
  add_foreign_key "valid_times", "competitions"
  add_foreign_key "venues", "competitions"
end
