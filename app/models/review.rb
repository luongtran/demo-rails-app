class Review < ActiveRecord::Base
	belongs_to :product
	#attr_accessible :author, :title,:content,:rating

	before_save :force_rating 
	def force_rating
		if self.rating >=10
			self.rating=10
		end
		if self.rating <1
			self.rating =1
		end	
		
	end

end
