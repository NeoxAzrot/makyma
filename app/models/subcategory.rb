class Subcategory < ApplicationRecord
	has_many :products
	belongs_to :category

	def to_s
		"#{title}"
	end
end
