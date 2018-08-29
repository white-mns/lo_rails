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

ActiveRecord::Schema.define(version: 2018_08_29_104038) do

  create_table "card_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "card_id"
    t.string "name"
    t.integer "lv"
    t.integer "lp"
    t.integer "fp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.index ["card_id"], name: "index_card_data_on_card_id"
    t.index ["fp"], name: "index_card_data_on_fp"
    t.index ["kind"], name: "index_card_data_on_kind"
    t.index ["lp"], name: "index_card_data_on_lp"
    t.index ["lv"], name: "index_card_data_on_lv"
    t.index ["name"], name: "index_card_data_on_name"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "s_no"
    t.string "name"
    t.integer "possession"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cards_on_card_id"
    t.index ["e_no", "s_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["name"], name: "index_cards_on_name"
    t.index ["possession"], name: "index_cards_on_possession"
  end

  create_table "characteristics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "str"
    t.integer "vit"
    t.integer "int"
    t.integer "mnd"
    t.integer "tec"
    t.integer "eva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["eva"], name: "index_characteristics_on_eva"
    t.index ["int"], name: "index_characteristics_on_int"
    t.index ["mnd"], name: "index_characteristics_on_mnd"
    t.index ["str"], name: "index_characteristics_on_str"
    t.index ["tec"], name: "index_characteristics_on_tec"
    t.index ["vit"], name: "index_characteristics_on_vit"
  end

  create_table "get_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "name"
    t.integer "card_id"
    t.integer "get_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_get_cards_on_card_id"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["get_type"], name: "index_get_cards_on_get_type"
    t.index ["name"], name: "index_get_cards_on_name"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "i_no"
    t.string "name"
    t.integer "equip"
    t.integer "kind"
    t.integer "effect"
    t.integer "lv"
    t.integer "potency"
    t.string "potency_str"
    t.integer "precision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "i_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["effect"], name: "index_items_on_effect"
    t.index ["equip"], name: "index_items_on_equip"
    t.index ["kind"], name: "index_items_on_kind"
    t.index ["lv"], name: "index_items_on_lv"
    t.index ["name"], name: "index_items_on_name"
    t.index ["potency"], name: "index_items_on_potency"
    t.index ["potency_str"], name: "index_items_on_potency_str"
    t.index ["precision"], name: "index_items_on_precision"
  end

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

  create_table "parameter_controls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "cond"
    t.integer "day"
    t.integer "mod"
    t.integer "cvp"
    t.integer "pvp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cond"], name: "index_parameter_controls_on_cond"
    t.index ["cvp"], name: "index_parameter_controls_on_cvp"
    t.index ["day"], name: "index_parameter_controls_on_day"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["mod"], name: "index_parameter_controls_on_mod"
    t.index ["pvp"], name: "index_parameter_controls_on_pvp"
  end

  create_table "parameter_fights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "lv"
    t.integer "rank"
    t.integer "exp"
    t.integer "next"
    t.integer "mlp"
    t.integer "mfp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["e_no"], name: "index_parameter_fights_on_e_no"
    t.index ["exp"], name: "index_parameter_fights_on_exp"
    t.index ["generate_no"], name: "index_parameter_fights_on_generate_no"
    t.index ["lv"], name: "index_parameter_fights_on_lv"
    t.index ["mfp"], name: "index_parameter_fights_on_mfp"
    t.index ["mlp"], name: "index_parameter_fights_on_mlp"
    t.index ["next"], name: "index_parameter_fights_on_next"
    t.index ["rank"], name: "index_parameter_fights_on_rank"
    t.index ["result_no"], name: "index_parameter_fights_on_result_no"
  end

  create_table "parameter_progresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "tip"
    t.integer "tip_t"
    t.integer "build_t"
    t.integer "mark_t"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_t"], name: "index_parameter_progresses_on_build_t"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["mark_t"], name: "index_parameter_progresses_on_mark_t"
    t.index ["tip"], name: "index_parameter_progresses_on_tip"
    t.index ["tip_t"], name: "index_parameter_progresses_on_tip_t"
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
