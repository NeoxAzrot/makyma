class Alternative < ApplicationRecord
  belongs_to :product

  def to_s
  	"#{title}"
  end
end
