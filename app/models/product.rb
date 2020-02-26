class Product < ApplicationRecord
  belongs_to :category
  has_many :alternatives

  def to_s
  	"#{title}"
  end
end
