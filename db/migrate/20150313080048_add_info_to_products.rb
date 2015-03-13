class AddInfoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :info, :text
  end
end
