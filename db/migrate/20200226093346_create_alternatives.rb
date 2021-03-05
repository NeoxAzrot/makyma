class CreateAlternatives < ActiveRecord::Migration[5.2]
  def change
    create_table :alternatives do |t|
      t.references :product, foreign_key: true
      t.string :title
      t.text :description
      t.text :source

      t.timestamps
    end
  end
end
