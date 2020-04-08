class Category < ApplicationRecord
	has_many :products
  has_many :alternatives, through: :products

	def to_s
		"#{title}"
	end
end
