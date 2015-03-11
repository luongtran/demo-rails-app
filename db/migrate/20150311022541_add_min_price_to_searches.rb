class AddMinPriceToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :min_price, :decimal
  end
end
