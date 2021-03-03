class Alternative < ApplicationRecord
  belongs_to :product
  belongs_to :alternative_type_filter

  default_scope { order(:title) }

  def to_s
    "#{title}"
  end
end
