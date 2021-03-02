class AddWhereToFindToAlternatives < ActiveRecord::Migration[5.2]
  def change
    add_column :alternatives, :whereToFind, :jsonb, default: {"local": false, "diy": false, "online": false}
  end
end
