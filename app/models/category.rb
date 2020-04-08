class Category < ApplicationRecord
	has_many :products
	has_many :subcategories

	def to_s
		"#{title}"
	end
end
