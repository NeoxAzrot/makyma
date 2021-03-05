class AddImgUrlToAlternatives < ActiveRecord::Migration[5.2]
  def change
    add_column :alternatives, :imgUrl, :string, default: ""
  end
end
