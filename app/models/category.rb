class Category < ApplicationRecord
	has_many :products

	def to_s
		"#{titre}"
	end
end
