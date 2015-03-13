class Category < ActiveRecord::Base
	has_many :products
	accepts_nested_attributes_for :products, allow_destroy: true
end
