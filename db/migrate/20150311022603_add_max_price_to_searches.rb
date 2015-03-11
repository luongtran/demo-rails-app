class AddMaxPriceToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :max_price, :decimal
  end
end
