class Alternative < ApplicationRecord
  belongs_to :product
  belongs_to :alternative_type_filter

  has_one_attached :image

  default_scope { order("created_at DESC") }

  def to_s
    "#{title}"
  end
end
