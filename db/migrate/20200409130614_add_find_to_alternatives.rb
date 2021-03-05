class AddFindToAlternatives < ActiveRecord::Migration[5.2]
  def change
    add_column :alternatives, :find, :text
  end
end
