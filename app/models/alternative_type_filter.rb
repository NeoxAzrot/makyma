class AlternativeTypeFilter < ApplicationRecord
  has_many :alternatives
  has_many :suggested_alternatives

  default_scope { order(:title) }

  def to_s
  	"#{title}"
  end
end
