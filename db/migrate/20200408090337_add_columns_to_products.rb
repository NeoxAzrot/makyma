class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :subcategory, foreign_key: true
  end
end
