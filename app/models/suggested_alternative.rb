class SuggestedAlternative < ApplicationRecord
  belongs_to :product
  belongs_to :alternative_type_filter

  default_scope { order(:title) }

  validates :product, :alternative_type_filter, :title, :presence => :true

  def to_s
    "#{title}"
  end

end
