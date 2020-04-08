class Category < ApplicationRecord
	has_many :alternatives, through: :products
	has_many :subcategories
	has_many :products

	def to_s
		"#{title}"
	end

end
