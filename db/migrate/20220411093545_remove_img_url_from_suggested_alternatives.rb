class RemoveImgUrlFromSuggestedAlternatives < ActiveRecord::Migration[5.2]
  def change
    remove_column :suggested_alternatives, :imgUrl, :string
  end
end
