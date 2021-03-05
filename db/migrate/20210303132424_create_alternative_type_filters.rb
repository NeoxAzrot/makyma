class CreateAlternativeTypeFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :alternative_type_filters do |t|
      t.string :title

      t.timestamps
    end

    add_reference :alternatives, :alternative_type_filter, index:true, foreign_key: true, default: 1
    add_reference :suggested_alternatives, :alternative_type_filter, index:true, foreign_key: true, default: 1
  end


end
