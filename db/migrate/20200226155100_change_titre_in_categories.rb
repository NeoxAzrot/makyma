class ChangeTitreInCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :categories, :titre, :title
  end
end
