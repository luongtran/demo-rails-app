class Reviews < ActiveRecord::Migration
  def change
  	create_table :reviews do |t|
      t.string :author
      t.string :title
      t.string :content
      t.integer :rating
      t.string :title
      t.integer :product_id
      t.timestamps
    end
  end
end
