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

ActiveRecord::Schema.define(version: 2020_11_03_044216) do

  create_table "bugs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "bug_e_no"
    t.integer "lv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["bug_e_no"], name: "index_bugs_on_bug_e_no"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["lv"], name: "index_bugs_on_lv"
    t.index ["order"], name: "index_bugs_on_order"
  end

  create_table "card_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "card_id"
    t.string "name"
    t.integer "lv"
    t.integer "lp"
    t.integer "fp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.integer "lpfp"
    t.index ["card_id"], name: "index_card_data_on_card_id"
    t.index ["fp"], name: "index_card_data_on_fp"
    t.index ["kind"], name: "index_card_data_on_kind"
    t.index ["lp"], name: "index_card_data_on_lp"
    t.index ["lpfp"], name: "index_card_data_on_lpfp"
    t.index ["lv"], name: "index_card_data_on_lv"
    t.index ["name", "card_id"], name: "name_and_cardid"
    t.index ["name"], name: "index_card_data_on_name", length: 191
  end

  create_table "card_use_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "battle_page"
    t.integer "party"
    t.text "use_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_page", "party", "result_no", "generate_no"], name: "resultno_and_battle_page"
  end

  create_table "card_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "battle_page"
    t.integer "e_no"
    t.integer "party"
    t.integer "card_id"
    t.integer "success"
    t.integer "control"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "turn"
    t.index ["card_id", "e_no", "result_no", "generate_no", "party"], name: "cardid_and_eno_and_resultno_and_party"
    t.index ["card_id"], name: "index_card_users_on_card_id"
    t.index ["control"], name: "index_card_users_on_control"
    t.index ["result_no", "card_id"], name: "resultno_cardid"
    t.index ["result_no", "success", "e_no", "battle_page", "party", "generate_no"], name: "resultno_and_battle_page"
    t.index ["turn"], name: "index_card_users_on_turn"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
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
    t.index ["name"], name: "index_cards_on_name", length: 191
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

  create_table "command_action_rankings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "card_id"
    t.integer "rank_type"
    t.integer "rank"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_command_action_rankings_on_card_id"
    t.index ["num"], name: "index_command_action_rankings_on_num"
    t.index ["rank"], name: "index_command_action_rankings_on_rank"
    t.index ["rank_type"], name: "index_command_action_rankings_on_rank_type"
    t.index ["result_no", "generate_no"], name: "resultno_and_generateno"
  end

  create_table "command_actions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "act"
    t.integer "s_no"
    t.integer "timing"
    t.integer "gowait"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["act"], name: "index_command_actions_on_act"
    t.index ["card_id"], name: "index_command_actions_on_card_id"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["gowait"], name: "index_command_actions_on_gowait"
    t.index ["s_no"], name: "index_command_actions_on_s_no"
    t.index ["timing"], name: "index_command_actions_on_timing"
  end

  create_table "damage_buffers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "battle_page"
    t.integer "act_id"
    t.integer "e_no"
    t.integer "buffer_id"
    t.integer "lv"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_page", "act_id", "e_no", "result_no", "generate_no"], name: "resultno_and_battle_page_and_act_id"
    t.index ["battle_page", "act_id", "result_no", "buffer_id", "e_no", "generate_no"], name: "resultno_and_battlepage_and_act_id_and_buffer_id", unique: true
    t.index ["buffer_id"], name: "index_damage_buffers_on_buffer_id"
    t.index ["lv"], name: "index_damage_buffers_on_lv"
    t.index ["result_no"], name: "index_damage_buffers_on_result_no"
    t.index ["value"], name: "index_damage_buffers_on_value"
  end

  create_table "damages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "battle_page"
    t.integer "act_id"
    t.integer "e_no"
    t.integer "party"
    t.integer "card_id"
    t.integer "chain"
    t.integer "target_e_no"
    t.integer "target_party"
    t.integer "act_type"
    t.integer "element"
    t.integer "damage"
    t.integer "is_weak"
    t.integer "is_critical"
    t.integer "is_clean"
    t.integer "is_vanish"
    t.integer "is_absorb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "turn"
    t.integer "line"
    t.integer "target_line"
    t.integer "party_num"
    t.integer "target_party_num"
    t.index ["act_id"], name: "index_damages_on_act_id"
    t.index ["act_type"], name: "index_damages_on_act_type"
    t.index ["battle_page", "e_no", "result_no", "generate_no"], name: "resultno_and_battle_page"
    t.index ["card_id"], name: "index_damages_on_card_id"
    t.index ["chain"], name: "index_damages_on_chain"
    t.index ["damage"], name: "index_damages_on_damage"
    t.index ["element"], name: "index_damages_on_element"
    t.index ["is_absorb"], name: "index_damages_on_is_absorb"
    t.index ["is_clean"], name: "index_damages_on_is_clean"
    t.index ["is_critical"], name: "index_damages_on_is_critical"
    t.index ["is_vanish"], name: "index_damages_on_is_vanish"
    t.index ["is_weak"], name: "index_damages_on_is_weak"
    t.index ["line"], name: "index_damages_on_line"
    t.index ["party"], name: "index_damages_on_party"
    t.index ["party_num"], name: "index_damages_on_party_num"
    t.index ["result_no"], name: "index_damages_on_result_no"
    t.index ["target_e_no"], name: "index_damages_on_target_e_no"
    t.index ["target_line"], name: "index_damages_on_target_line"
    t.index ["target_party"], name: "index_damages_on_target_party"
    t.index ["target_party_num"], name: "index_damages_on_target_party_num"
    t.index ["turn"], name: "index_damages_on_turn"
  end

  create_table "development_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "development_result"
    t.integer "bellicose"
    t.integer "party_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bellicose"], name: "index_development_results_on_bellicose"
    t.index ["development_result"], name: "index_development_results_on_development_result"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["party_num"], name: "index_development_results_on_party_num"
  end

  create_table "dices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "number"
    t.integer "dice"
    t.integer "use_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dice"], name: "index_dices_on_dice"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_e_no"
    t.index ["number"], name: "index_dices_on_number"
    t.index ["use_item"], name: "index_dices_on_use_item"
  end

  create_table "drop_min_subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "card_id"
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
    t.index ["arithmetic"], name: "index_drop_min_subjects_on_arithmetic"
    t.index ["astronomy"], name: "index_drop_min_subjects_on_astronomy"
    t.index ["card_id"], name: "index_drop_min_subjects_on_card_id"
    t.index ["chemistry"], name: "index_drop_min_subjects_on_chemistry"
    t.index ["cooking"], name: "index_drop_min_subjects_on_cooking"
    t.index ["curse"], name: "index_drop_min_subjects_on_curse"
    t.index ["dance"], name: "index_drop_min_subjects_on_dance"
    t.index ["demonology"], name: "index_drop_min_subjects_on_demonology"
    t.index ["fengshui"], name: "index_drop_min_subjects_on_fengshui"
    t.index ["fire"], name: "index_drop_min_subjects_on_fire"
    t.index ["geography"], name: "index_drop_min_subjects_on_geography"
    t.index ["guard"], name: "index_drop_min_subjects_on_guard"
    t.index ["illusion"], name: "index_drop_min_subjects_on_illusion"
    t.index ["life"], name: "index_drop_min_subjects_on_life"
    t.index ["movement"], name: "index_drop_min_subjects_on_movement"
    t.index ["music"], name: "index_drop_min_subjects_on_music"
    t.index ["psychology"], name: "index_drop_min_subjects_on_psychology"
    t.index ["result_no", "generate_no"], name: "resultno_and_generateno"
    t.index ["shot"], name: "index_drop_min_subjects_on_shot"
    t.index ["slash"], name: "index_drop_min_subjects_on_slash"
    t.index ["stroke"], name: "index_drop_min_subjects_on_stroke"
    t.index ["technology"], name: "index_drop_min_subjects_on_technology"
    t.index ["theft"], name: "index_drop_min_subjects_on_theft"
    t.index ["theology"], name: "index_drop_min_subjects_on_theology"
    t.index ["thrust"], name: "index_drop_min_subjects_on_thrust"
    t.index ["trick"], name: "index_drop_min_subjects_on_trick"
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "set_col"
    t.integer "set_lv"
    t.string "name"
    t.integer "holiday"
    t.integer "division"
    t.integer "detail_division"
    t.integer "lv"
    t.integer "value"
    t.integer "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_division"], name: "index_facilities_on_detail_division"
    t.index ["division"], name: "index_facilities_on_division"
    t.index ["e_no", "set_lv", "set_col", "result_no", "generate_no"], name: "resultno_and_eno", length: { set_col: 191 }
    t.index ["holiday"], name: "index_facilities_on_holiday"
    t.index ["lv"], name: "index_facilities_on_lv"
    t.index ["name"], name: "index_facilities_on_name", length: 191
    t.index ["period"], name: "index_facilities_on_period"
    t.index ["value"], name: "index_facilities_on_value"
  end

  create_table "facility_division_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "division_id"
    t.integer "detail"
    t.integer "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail"], name: "index_facility_division_data_on_detail"
    t.index ["division_id"], name: "index_facility_division_data_on_division_id"
    t.index ["major"], name: "index_facility_division_data_on_major"
  end

  create_table "facility_uses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "facility_name"
    t.integer "facility_effect"
    t.integer "facility_lv"
    t.integer "facility_e_no"
    t.integer "usage"
    t.integer "cost"
    t.integer "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recovery_lv"
    t.integer "number"
    t.index ["cost"], name: "index_facility_uses_on_cost"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["facility_e_no"], name: "index_facility_uses_on_facility_e_no"
    t.index ["facility_effect"], name: "index_facility_uses_on_facility_effect"
    t.index ["facility_lv"], name: "index_facility_uses_on_facility_lv"
    t.index ["facility_name"], name: "index_facility_uses_on_facility_name"
    t.index ["number"], name: "index_facility_uses_on_number"
    t.index ["recovery_lv"], name: "index_facility_uses_on_recovery_lv"
    t.index ["success"], name: "index_facility_uses_on_success"
    t.index ["usage"], name: "index_facility_uses_on_usage"
  end

  create_table "frontiers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "col"
    t.integer "lv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["col"], name: "index_frontiers_on_col"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_e_no"
    t.index ["lv"], name: "index_frontiers_on_lv"
  end

  create_table "get_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
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
    t.index ["name"], name: "index_get_cards_on_name", length: 191
  end

  create_table "item_uses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "i_no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recovery_lv"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["i_no"], name: "index_item_uses_on_i_no"
    t.index ["name"], name: "index_item_uses_on_name", length: 191
    t.index ["recovery_lv"], name: "index_item_uses_on_recovery_lv"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
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
    t.index ["name"], name: "index_items_on_name", length: 191
    t.index ["potency"], name: "index_items_on_potency"
    t.index ["potency_str"], name: "index_items_on_potency_str", length: 191
    t.index ["precision"], name: "index_items_on_precision"
  end

  create_table "manufactures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "facility_name"
    t.integer "facility_effect"
    t.integer "facility_lv"
    t.integer "facility_e_no"
    t.string "item_name"
    t.integer "usage"
    t.integer "cost"
    t.integer "kind"
    t.integer "effect"
    t.integer "effect_lv"
    t.integer "potency"
    t.integer "precision"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost"], name: "index_manufactures_on_cost"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["effect"], name: "index_manufactures_on_effect"
    t.index ["effect_lv"], name: "index_manufactures_on_effect_lv"
    t.index ["facility_e_no"], name: "index_manufactures_on_facility_e_no"
    t.index ["facility_effect"], name: "index_manufactures_on_facility_effect"
    t.index ["facility_lv"], name: "index_manufactures_on_facility_lv"
    t.index ["facility_name"], name: "index_manufactures_on_facility_name", length: 191
    t.index ["item_name"], name: "index_manufactures_on_item_name", length: 191
    t.index ["kind"], name: "index_manufactures_on_kind"
    t.index ["potency"], name: "index_manufactures_on_potency"
    t.index ["precision"], name: "index_manufactures_on_precision"
    t.index ["total"], name: "index_manufactures_on_total"
    t.index ["usage"], name: "index_manufactures_on_usage"
  end

  create_table "max_chains", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "battle_page"
    t.integer "party"
    t.integer "max_chain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_page", "party", "result_no", "generate_no"], name: "resultno_and_battle_page"
    t.index ["max_chain"], name: "index_max_chains_on_max_chain"
  end

  create_table "meddling_success_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "card_id"
    t.integer "chain"
    t.integer "success"
    t.integer "miss"
    t.integer "no_apply"
    t.integer "sum"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "card_id", "chain", "result_no", "generate_no"], name: "resultno_eno_cardid_chain"
    t.index ["miss"], name: "index_meddling_success_rates_on_miss"
    t.index ["no_apply"], name: "index_meddling_success_rates_on_no_apply"
    t.index ["rate"], name: "index_meddling_success_rates_on_rate"
    t.index ["success"], name: "index_meddling_success_rates_on_success"
    t.index ["sum"], name: "index_meddling_success_rates_on_sum"
  end

  create_table "meddling_targets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "card_id"
    t.integer "chain"
    t.integer "target_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count"], name: "index_meddling_targets_on_count"
    t.index ["e_no", "card_id", "chain", "result_no", "generate_no"], name: "resultno_eno_cardid_chain"
    t.index ["target_id"], name: "index_meddling_targets_on_target_id"
  end

  create_table "mission_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "mission_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_names_on_mission_id"
    t.index ["name"], name: "index_mission_names_on_name", length: 191
  end

  create_table "missions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "mission_id"
    t.integer "mission_type"
    t.integer "status"
    t.string "col"
    t.integer "lv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["col"], name: "index_missions_on_col"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno_cardid_chain"
    t.index ["lv"], name: "index_missions_on_lv"
    t.index ["mission_id"], name: "index_missions_on_mission_id"
    t.index ["mission_type"], name: "index_missions_on_mission_type"
    t.index ["status"], name: "index_missions_on_status"
  end

  create_table "names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "name"
    t.string "player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
  end

  create_table "new_card_uses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_new_card_uses_on_card_id"
    t.index ["result_no", "generate_no"], name: "resultno_and_generateno"
  end

  create_table "new_get_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "card_id"
    t.integer "get_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_new_get_cards_on_card_id"
    t.index ["get_type"], name: "index_new_get_cards_on_get_type"
    t.index ["result_no", "generate_no"], name: "resultno_and_generateno"
  end

  create_table "new_item_uses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_new_item_uses_on_name"
    t.index ["result_no", "generate_no"], name: "resultno_and_generateno"
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

  create_table "parameter_developments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "lv"
    t.integer "rank"
    t.integer "mlp"
    t.integer "mfp"
    t.integer "cond"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_result_no"
    t.integer "last_generate_no"
    t.index ["cond"], name: "index_parameter_developments_on_cond"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_e_no"
    t.index ["last_generate_no"], name: "index_parameter_developments_on_last_generate_no"
    t.index ["last_result_no"], name: "index_parameter_developments_on_last_result_no"
    t.index ["lv"], name: "index_parameter_developments_on_lv"
    t.index ["mfp"], name: "index_parameter_developments_on_mfp"
    t.index ["mlp"], name: "index_parameter_developments_on_mlp"
    t.index ["rank"], name: "index_parameter_developments_on_rank"
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

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "invation_col"
    t.integer "invation_lv"
    t.string "return_col"
    t.integer "return_lv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["invation_col"], name: "index_places_on_invation_col"
    t.index ["invation_lv"], name: "index_places_on_invation_lv"
    t.index ["return_col"], name: "index_places_on_return_col"
    t.index ["return_lv"], name: "index_places_on_return_lv"
  end

  create_table "pre_total_party_nums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "count_type"
    t.integer "party_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count_type"], name: "index_pre_total_party_nums_on_count_type"
    t.index ["e_no"], name: "index_pre_total_party_nums_on_e_no"
    t.index ["party_num"], name: "index_pre_total_party_nums_on_party_num"
    t.index ["result_no", "count_type", "e_no"], name: "resultno_counttype"
    t.index ["result_no", "e_no", "count_type"], name: "resultno_eno"
  end

  create_table "pre_wins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "win"
    t.integer "draw"
    t.integer "lose"
    t.integer "all"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["all"], name: "index_pre_wins_on_all"
    t.index ["draw"], name: "index_pre_wins_on_draw"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_e_no"
    t.index ["lose"], name: "index_pre_wins_on_lose"
    t.index ["win"], name: "index_pre_wins_on_win"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
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

  create_table "proper_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proper_names_on_name", length: 191
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

  create_table "trainings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "training_type"
    t.integer "training"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_and_eno"
    t.index ["training"], name: "index_trainings_on_training"
    t.index ["training_type"], name: "index_trainings_on_training_type"
  end

  create_table "uploaded_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_no", "generate_no"], name: "resultno_generateno"
  end

end
