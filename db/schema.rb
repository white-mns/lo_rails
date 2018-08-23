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

ActiveRecord::Schema.define(version: 2018_08_23_052153) do

  create_table "names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "name"
    t.string "player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
  end

  create_table "pgws", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "pgws_type"
    t.integer "pgws_name_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["pgws_name_id"], name: "index_pgws_on_pgws_name_id"
    t.index ["pgws_type"], name: "index_pgws_on_pgws_type"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "nickname"
    t.integer "tone"
    t.string "first"
    t.string "second"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["tone"], name: "index_profiles_on_tone"
  end

  create_table "proper_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "slash"
    t.integer "thrust"
    t.integer "stroke"
    t.integer "shot"
    t.integer "guard"
    t.integer "dance"
    t.integer "theft"
    t.integer "cooking"
    t.integer "technology"
    t.integer "movement"
    t.integer "chemistry"
    t.integer "arithmetic"
    t.integer "fire"
    t.integer "theology"
    t.integer "life"
    t.integer "demonology"
    t.integer "geography"
    t.integer "astronomy"
    t.integer "fengshui"
    t.integer "psychology"
    t.integer "music"
    t.integer "curse"
    t.integer "illusion"
    t.integer "trick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arithmetic"], name: "index_subjects_on_arithmetic"
    t.index ["astronomy"], name: "index_subjects_on_astronomy"
    t.index ["chemistry"], name: "index_subjects_on_chemistry"
    t.index ["cooking"], name: "index_subjects_on_cooking"
    t.index ["curse"], name: "index_subjects_on_curse"
    t.index ["dance"], name: "index_subjects_on_dance"
    t.index ["demonology"], name: "index_subjects_on_demonology"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["fengshui"], name: "index_subjects_on_fengshui"
    t.index ["fire"], name: "index_subjects_on_fire"
    t.index ["geography"], name: "index_subjects_on_geography"
    t.index ["guard"], name: "index_subjects_on_guard"
    t.index ["illusion"], name: "index_subjects_on_illusion"
    t.index ["life"], name: "index_subjects_on_life"
    t.index ["movement"], name: "index_subjects_on_movement"
    t.index ["music"], name: "index_subjects_on_music"
    t.index ["psychology"], name: "index_subjects_on_psychology"
    t.index ["shot"], name: "index_subjects_on_shot"
    t.index ["slash"], name: "index_subjects_on_slash"
    t.index ["stroke"], name: "index_subjects_on_stroke"
    t.index ["technology"], name: "index_subjects_on_technology"
    t.index ["theft"], name: "index_subjects_on_theft"
    t.index ["theology"], name: "index_subjects_on_theology"
    t.index ["thrust"], name: "index_subjects_on_thrust"
    t.index ["trick"], name: "index_subjects_on_trick"
  end

end
