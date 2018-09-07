json.extract! card_datum, :id, :card_id, :name, :lv, :lp, :fp, :created_at, :updated_at
json.url card_datum_url(card_datum, format: :json)
