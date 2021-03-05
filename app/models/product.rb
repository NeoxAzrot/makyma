class Product < ApplicationRecord
  belongs_to :category
  has_many :alternatives

  default_scope { order(:title) }

  def to_s
  	"#{title}"
  end
end
