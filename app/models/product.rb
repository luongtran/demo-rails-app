class Product < ActiveRecord::Base
	has_many :order_items
	has_many :reviews ,:dependent => :destroy
    belongs_to :categori
    accepts_nested_attributes_for :reviews, allow_destroy: true
	default_scope { where(active: true)}

	#def self.search(keywords)
	#products=order(:name)
	#products =products.where("name like ?","%#{keywords}%") if keywords.present? products
	#end
 def self.search(search)
	 products = order(:name)
     products = products.where("name like ?", "%#{search}%") if search.present?
     products
  end

end
