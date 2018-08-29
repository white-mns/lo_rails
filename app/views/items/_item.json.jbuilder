json.extract! item, :id, :result_no, :generate_no, :e_no, :i_no, :name, :equip, :kind, :effect, :lv, :potency, :potency_str, :precision, :created_at, :updated_at
json.url item_url(item, format: :json)
