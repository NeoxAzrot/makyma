class RemoveImgUrlFromAlternatives < ActiveRecord::Migration[5.2]
  def change
    remove_column :alternatives, :imgUrl, :string
  end
end
