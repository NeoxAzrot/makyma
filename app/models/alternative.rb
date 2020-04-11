class Alternative < ApplicationRecord
  belongs_to :product

  default_scope { order(:title) }

  def to_s
    "#{title}"
  end
end
