class Category < ApplicationRecord
	has_many :products

	def to_s
		"#{title}"
	end
end
