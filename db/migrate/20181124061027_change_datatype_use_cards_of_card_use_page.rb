class ChangeDatatypeUseCardsOfCardUsePage < ActiveRecord::Migration[5.2]
  def change
      change_column :card_use_pages, :use_cards, :text
  end
end
