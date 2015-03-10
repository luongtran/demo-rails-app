class Product < ActiveRecord::Base
	has_many :order_items
	has_many :reviews ,:dependent => :destroy
    belongs_to :categori
	default_scope { where(active: true)}

	
end
